page 50103 "Book Detail Fact Box"
{
    PageType = CardPart;
    SourceTable = Book;

    layout
    {
        area(content)
        {
                field("No."; "No")
                {
                    ApplicationArea = ALL;
                    trigger OnDrillDown()
                    begin
                        //Funktion ist noch anzulegen
                        //ShowDetails();
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
                //FlowField noch anzeigen
        }
    }
}