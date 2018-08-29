page 50103 "Book Detail Fact Box"
{
    PageType = Card;
    SourceTable = Book;

    layout
    {
        area(content)
        {
                field("No."; "No")
                {
                    ApplicationArea = ALL;
                }
                field(Title; Title)
                {
                    ApplicationArea = ALL;
                }
                    field(Autor; Autor)
                {
                    ApplicationArea = ALL;
                }
        }
    }
}