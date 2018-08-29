query 50100 "MyFirstQuery"
{
    QueryType = Normal;
    
    elements
    {
        dataitem(Book; Book)
        {
            column(No; No)
            {
                
            }
            filter(FilterName; No)
            {
                
            }
        }
    }
    
    var
        myInt: Integer;
    
    trigger OnBeforeOpen()
    begin
        
    end;
}