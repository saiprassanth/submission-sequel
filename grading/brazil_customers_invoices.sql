/*saiprassanth.ramesh@accenture.com*/

/*24nov2017*/

/*grading_set solution*/

/*3.brazil_customers_invoices.sql: Provide a query showing the Invoices of customers who are from Brazil. The resultant table should show the customer's full name, Invoice ID, Date of the invoice and billing country.*/
select c.firstname,c.lastname,i.invoiceid,i.invoicedate from customer c,invoice i where c.customerid=i.invoiceid and c.country like 'brazil';
