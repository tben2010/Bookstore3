page 50102 "Book List"
{
    Caption = 'Books';
    PageType = List;
    UsageCategory = Lists;
    ApplicationArea = All;
    SourceTable = Book;
    CardPageId = "Book Card";
    Editable = false;

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field(No; No)
                {
                    ApplicationArea = All;
                }

                field(Title;Title)
                {
                    ApplicationArea = All;
                }

                field(Autor;Autor)
                {
                    ApplicationArea = All;
                }

                field(Hardcover;Hardcover)
                {
                    ApplicationArea = All;
                }

                field("Page Count";"Page Count")
                {
                    ApplicationArea = All;
                }
                
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action("Export Books")
            {
                Caption = 'Export Books';
                ApplicationArea = All;
                Image = XMLFile;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                //Alternative 1
               // RunObject = xmlport ExportBooks;

               //Alternative 2, mit OnAction Trigger  
               trigger OnAction()
                   var 
                    Book: Record Book;
                    ExpXml: XmlPort ExportBooks;
                begin
                    //
                    CurrPage.SetSelectionFilter(Book);
                    ExpXml.SetTableView(Book);
                    ExpXml.Run();
                end;
                
            }

        }

    }
}