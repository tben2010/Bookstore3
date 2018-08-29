xmlport 50100 "ExportBooks"
{
    Caption = 'Export Books';
    Format = Xml;
    UseRequestPage = false;
    Direction = Export;
    
    schema
    {
        textelement(Books)
        {
            tableelement(Book; Book)
            {
                fieldattribute(Number; Book."No") {}
                fieldelement(Title;Book.Title) {}
                fieldelement(Autor;Book.Autor) {}
                fieldelement(PageCount;Book."Page Count") {}
                fieldelement(HardCover;Book.Hardcover) {}
            }
        }
    }
}