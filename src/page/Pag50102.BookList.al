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
}