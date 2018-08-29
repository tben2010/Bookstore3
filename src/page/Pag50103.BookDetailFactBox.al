page 50103 "Book Detail Fact Box"
{
    PageType = CardPart;
    ApplicationArea = All;
    UsageCategory = Administration;
    Editable = false;
    SourceTable = Book;
    
    layout
    {
        area(Content)
        {
            group("Book Details")
            {
                 field("No."; "No")
                {
                    ApplicationArea = ALL;
                    //DrillDown ShowDateils
                    trigger OnDrillDown()
                    begin
                        //ShowDetails einfügen als locale fkt
                    end;
                }
                field(Title; Title)
                {
                    ApplicationArea = ALL;
                }
                  field(Autor; Autor)
                {
                    ApplicationArea = ALL;
                }
                field("No. of Customers";"No. of Customers")
                {
                    ApplicationArea = All;
                }
                
            }
        }
    }
}