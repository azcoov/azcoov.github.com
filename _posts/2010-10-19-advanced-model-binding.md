---
layout: post
title: "MVC Advanced Model Binding"
excerpt:
  In order to post form data that the model binder understands, we need to setup our form to match the schema of our model. In this example, the contact name would be a “Name” input, and the contact phone numbers would be  a “PhoneNumbers” input and a “PhoneNumbersType” select. Because the Contact contains a list of PhoneNumbers, we need to make sure our phone and phone type inputs have an index number. Here is how that html might look
---

##The basic model

Basic model binding is simple. Imagine a Contact class that has a Name and PhoneNumber property:

	public class Contact {
	    public string Name { get; set; }
	    public string PhoneNumber { get; set; }
	}

and the simple controller:

	public ActionResult Edit(Contact contact) {
	    string name = contact.Name;
	    string number = contact.PhoneNumber;
	    return View();
	}

##The advanced model

But what happens when your model is more complex, for example you allow for a Contact to have many types of PhoneNumbers?

	public class Contact {
	    public string Name { get; set; }
	    public List<Phone> PhoneNumbers { get; set; }
	}

	public class Phone {
	    public string Number { get; set; }
	    public PhoneType Type { get; set; }
	}

	public class PhoneType {
	    public int Type_id { get; set; }
	    public string Description { get; set; }
	}

##HTML setup

In order to post form data that the model binder understands, we need to setup our form to match the schema of our model. In this example, the contact name would be a “Name” input, and the contact phone numbers would be  a “PhoneNumbers” input and a “PhoneNumbersType” select. Because the Contact contains a list of PhoneNumbers, we need to make sure our phone and phone type inputs have an index number. Here is how that html might look:

	<h2>Edit</h2>

	<input type="text" name="Name" />

	<input type="text" name="PhoneNumbers.[0].Number" />
	<select id="PhoneNumbers.[0].Type_id">
	  <option value="0">Home</option>
	  <option value="1">Work</option>
	</select>

	<input type="text" name="PhoneNumbers.[1].Number" />
	<select id="PhoneNumbers.[1].Type_id">
	  <option value="0">Home</option>
	  <option value="1">Work</option>
	</select>

	<input type="text" name="PhoneNumbers.[2].Number" />
	<select id="PhoneNumbers.[2].Type_id">
	  <option value="0">Home</option>
	  <option value="1">Work</option>
	</select>

In your action result, you are going to accept the Contact model as the parameter. The model binder will use reflection to parse the form fields and map them to your model. There is a catch. The sequence of the list of PhoneNumbers can not be out of order. For example, you can’t pass in phone 1,2,4, it will stop at two. Notice in the above example that the index of the three phone numbers is 0,1,2. Here is what the Controller would look like:

	public ActionResult Edit(Contact contact)
	{
	    string name = contact.Name;
	    List<Phone> phoneNumbers = contact.PhoneNumbers;
	    return View();
	}

##The database

Great so now we have a more advanced model binding scenario. How would save this to the database? There are many ways to do this but I’ll show you how I do it with sql server, xml, and a single call to the database.

I created a repository class that is responsible for communicating to my database. In that class I have a Edit method that accepts a Contact model. I want to send all of my phone data at once so I’m going to use a System.Xml.Linq.XElement to handle that. To convert my List<Phone>, I have a generic extension method that I use:

	public static class GenericExtensions
	{
	    public static XElement ToXElement<T>(this T obj)
	    {
	        XmlSerializerNamespaces emptyNamespace = new XmlSerializerNamespaces();
	        emptyNamespace.Add(String.Empty, String.Empty);
	        XmlSerializer xmlSerializer = new XmlSerializer(typeof(T));
	        XmlWriterSettings writerSettings = new XmlWriterSettings();
	        writerSettings.OmitXmlDeclaration = true;
	        StringWriter stringWriter = new StringWriter();
	        using (XmlWriter xmlWriter = XmlWriter.Create(stringWriter, writerSettings))
	        {
	            xmlSerializer.Serialize(xmlWriter, obj, emptyNamespace);
	        }
	        return XElement.Parse(stringWriter.ToString());
	    }
	}

Back in my repository class, I simply call .ToXElement() on my List<Phone>:

	phoneXML = contact.PhoneNumbers.ToXElement();

Here is what phoneXML looks like in the XML inspector:

	<ArrayOfPhone>
	    <Phone>
	        <Number>555-555-5553</Number>
	        <Type>
	            <Type_id>0</Type_id>
	        </Type>
	    </Phone>
	    <Phone>
	        <Number>555-555-5553</Number> 
	        <Type>
	            <Type_id>1</Type_id>
	        </Type> 
	    </Phone>
	    <Phone>
	        <Number>555-555-5553</Number> 
	        <Type>
	            <Type_id>1</Type_id>
	        </Type>
	    </Phone>
	</ArrayOfPhone>

Once I have my list of phone numbers in XML form, I make a call to the database (stored proc in my example) and pass in the contact name, and the phone number xml:

	CustomerDataContext db = new CustomerDataContext();
	db.sp_CustomerEdit(profile.Token, Customer_id, contact.Name, phoneXML);

In that stored procedure, I use sql’s built in xml goodness to update my table of phone numbers:

	insert into Phone (
	    Customer_id,
	    PhoneNumber,
	    PhoneType_id
	)
	select
	    @Customer_id,
	    p.col.value('./Number[1]','varchar(25)'),
	    p.col.value('./Type[1]/Type_id[1]','int')
	from 
	    @PhonesXML.nodes('/ArrayOfPhone/Phone') as p(col) 

So there you have it. It’s a simple way to do complex model binding and a database update. Next up I’m going to show how to add the 37Signals flavor of dynamically rendering more phone numbers of the fly with jQuery while still using the same model binding you see here.