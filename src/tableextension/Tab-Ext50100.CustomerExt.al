tableextension 50100 "CustomerExt" extends Customer
{
    fields
    {
        // Add changes to table fields here
        field(50100; "Bookno."; Code[20])
        {
            Caption = 'Bookno.';
            TableRelation = Book;
        }
    }
}