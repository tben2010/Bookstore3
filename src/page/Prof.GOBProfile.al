profile GOBProfile
{
    Description = 'GOB Profile';
    RoleCenter = "Order Processor Role Center";
    //Customizations muss noch hinzugefügt werden
    Customizations = MyCustomization;
}

pagecustomization MyCustomization customizes "Customer List"
{
    layout
    {
        modify("Location Code")
        {
            Visible = false;
        }
    }

    actions 
    {
        movebefore(NewSalesInvoice; NewSalesOrder)
    }
}

