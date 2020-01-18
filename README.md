# proteome_xml_for_prokka

[XSLT](https://en.wikipedia.org/wiki/XSLT) file to transform a UniProt proteome XML file to a protein fasta file for [Prokka](https://github.com/tseemann/prokka).

Extract information from the XML file for each protein to format a [FASTA file to be used as custom database](https://github.com/tseemann/prokka#fasta-database-format) with the `--proteins` arguments in Prokka.

```
>SeqID EC_number~~~gene~~~product~~~COG
```

## Installation

### Install a xslt processor

Example `xsltproc`, with Ubuntu/Debian:

```sh
sudo apt-get install xsltproc
```

### Download the XSLT file

Download `proteome_xml_for_prokka.xslt` from [Github](https://github.com/jeanmanguy/proteome_xml_for_prokka).

## Usage

```sh
xsltproc proteome_xml_for_prokka.xslt UNIPROT_XML_FILE
```

## Examples

### Single protein

Download a protein XML file from UniProt (e.g. [L-lactate dehydrogenase from _Lactobacillus casei_](https://www.uniprot.org/uniprot/P00343))

```sh
curl \
--fail \
"https://www.uniprot.org/uniprot/P00343.xml" \
--output "P00343.xml" # 25.3 kB
```

Conversion to FASTA

```sh
xsltproc \
proteome_xml_for_prokka.xslt \
P00343.xml \
> P00343.faa
```

Expected result:

```
>LDH_LACCA 1.1.1.27~~~ldh~~~L-lactate dehydrogenase~~~COG0039
MASITDKDHQKVILVGDGAVGSSYAYAMVLQGIAQEIGIVDIFKDKTKGDAIDLSNALPFTSPKKIYSAEYSDAKDADLVVITAGAPQKPGETRLDLVNKNLKILKSIVDPIVDSGFNGIFLVAANPVDILTYATWKLSGFPKNRVVGSGTSLDTARFRQSIAEMVNVDARSVHAYIMGEHGDTEFPVWSHANIGGVTIAEWVKAHPEIKEDKLVKMFEDVRDAAYEIIKLKGATFYGIATALARISKAILNDENAVLPLSVYMDGQYGLNDIYIGTPAVINRNGIQNILEIPLTDHEEESMQKSASQLKKVLTDAFAKNDIETRQ
```

### Proteome

Download a UniProt proteome XML file (e.g. [_Lactobacillus paracasei_ chromosome + pLSEI1 plasmid](https://www.uniprot.org/proteomes/UP000006381))

```sh
curl \
  --fail \
  'https://www.uniprot.org/uniprot/?query=proteome:UP000006381&format=xml' \
  --output 'UP000006381.xml' # 11.8 MB
```

Conversion to FASTA

```sh
xsltproc \
proteome_xml_for_prokka.xslt \
UP000006381.xml \
> UP000006381.faa
```

Expected result (3 first entries):

```
>RPOE_LACAC ~~~rpoE~~~Probable DNA-directed RNA polymerase subunit delta~~~COG3343
MGLDKFKDKNRDELSMIEVARAILEDNGKRMAFADIVNAVQKYLNKSDEEIRERLPQFYTDMNTDGEFISMGENVWALRSWFPYESVDEEVNHPEDEEEDDSRKHHKKVNAFLASATGDDDIIDYDNDDPEDDDLDAATDDSDDDYSDDDSDYDEDNDDADDVLPDGIEGQLSQLNDEDDDEDD
>XPT_LACAC 2.4.2.22~~~xpt~~~Xanthine phosphoribosyltransferase~~~COG0503
MKLLEERIKRDGEVLDGNVLKINSFLNHQVDPKLMMEVGKEFKRLFAGEQIDKVLTCEASGIAPGVMTAYQLGVPMVFARKKKPSTLNDAVYWADVFSYTKKVNSKICVEEKFLHEGENILIIDDFVAHGEAVKGMVNIAKQAHCNIVGVGAVVAKTFQGGSDWVKDEGLRFESLASIASFKDGQVHFEGEE
>RL6_LACAC ~~~rplF~~~50S ribosomal protein L6~~~COG0097
MSRIGLKTIEVPDSVTVTKEGDNITVKGPKGELTRYFDPKITFEQNDGEINFSRSSESDKALHGTERANLASMIEGVLNGYKKTLKLIGVGYRAQAQGNKITLNVGYSHPVVLTAPEGVSVKATSATDVEVEGVSKQDVGQFAAEIRAVRPPEPYKGKGIRYVDEYVRRKEGKTGK
```
