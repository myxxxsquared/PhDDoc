@default_files = ('thesis');

$pdf_mode = 5;
$dvipdf = "dvipdfmx %O -o %D %S";
$bibtex_use = 1.5;
$biber = "biber -l zh__pinyin --output-safechars %O %S";
$clean_ext = "run.xml";

