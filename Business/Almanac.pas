unit Almanac; // version 20-11-04
// unit� pour calcul des dates
// 20-11-04 avertissement : le lundi de pentecote est f�ri�
//                          si plus f�ri� voir nota // @@@@ ldp

// auteur : alantell - novembre 2004

// origine : livre ou web

interface

uses SysUtils;

type
  THSunRecord = record
    SAubeReel: TDateTime;  // reel
    SCrepReel: TDateTime;
    SAubeCivi: TDateTime;  // civil
    SCrepCivi: TDateTime;
    SAubeNaut: TDateTime;  // nautique
    SCrepNaut: TDateTime;
    SAubeAstr: TDateTime;  // astronomique
    SCrepAstr: TDateTime;
    end;

// variables globales publiques
var
  Aujourdhui: TDatetime; // date du jour
  Calenderreur: integer; // code retour erreur
  HSun: THSunRecord;

function GetAnnee(D:TDateTime):integer;            // extrait l'ann�e
function GetMois(D:TDateTime):integer;             // extrait le mois
function GetJour(D:TDateTime):integer;             // extrait le jour
function DateDebAnnee(D:TDateTime):TDateTime;      // le 01/01 de l'ann�e
function DateFinAnnee(D:TDateTime):TDateTime;      // le 31/12 de l'ann�e
function DateDebMois(D:TDateTime):TDateTime;       // date d�but du mois
function DateFinMois(D:TDateTime):TDateTime;       // date fin du mois
function DateDebTrimestre(D:TDateTime):TDateTime;  //01/01,01/04,01/07,01/10
function DateFinTrimestre(D:TDateTime):TDateTime;  //31/03,30/06,30/09,31/12
function DateDebSemaine(D:TDateTime):TDateTime;    // date du lundi
function DateFinSemaine(D:TDateTime):TDateTime;    // date du dimanche
function NumerodeJour(D:TDateTime):integer;        // rang du jour de l'ann�e
function NumeroSemaine(D:TDateTime):integer;       // num�ro de la semaine
function NombreJoursAnnee(D:TDateTime):integer;    // 365 ou 366 jours
function NombreSemainesAnnee(D:TDateTime):integer; // 52 ou 53 semaines
function JourDeSemaine(D:TDateTime):integer;       // 1 = lundi..7 = dimanche
function JoursDansMois(D:TDateTime):integer;       // nb de jours 28,29,30,31
function NiemeJourduMois(D:TDateTime; rang,js:integer):TDateTime;//date du rang n jr de Sem (js)
function IncremAnnee(D:TDateTime; waa:integer):TDateTime; // +-waa ann�es
function IncremMois(D:TDateTime; wmm:integer):TDateTime;  // +-wmm  mois
function IncremSem(D:TDateTime; wsem:integer):TDateTime;  // +-wsem semaines
function IncremJour(D:TDateTime; wjj:integer):TDateTime;  // +-wjj jours 
function Bissextile(D:TDateTime):Boolean;          // true si ann�e bissextile
function Dateser(waa,wmm,wjj:integer):TDateTime;   // Additions sur a,m,j
// comparaisons de dates D2 - D1  N�gatif si D2 < D1 positif si D2 > D1
function DiffDates(D1,D2:TDateTime):integer;       // D2 - D1 en jours
function EgalDates(D1,D2:TDateTime):boolean;       // True si D1 = D2
function EditDiffDates(D1,D2:TDateTime):string;    // en string
procedure AAMMJJDiffDates(D1,D2:TDateTime; var waa,wmm,wjj:integer);
function DiffMois(D1,D2:TDateTime):integer;     // diff�rence D2-D1 en mois
function GetAge(D:TDateTime):integer;           // retourne age en integer
function GetAgeStr(D:TDateTime):string;         // retourne age en string
function GetAgeFutur(DD,DF:TDateTime):integer;  // retourne age futur en integer
function GetAgeStrFutur(DD,DF:TDateTime):string; // retourne age futur en string
// jours f�ri�s
function Paques(D:TDateTime):TDateTime;         // date de p�ques
procedure InitFeries(D:TDateTime);              // non publi�
function  IsFerie(D:TDateTime):boolean;         // True si jour f�ri�
function  GetRangFerie(D:TDateTime):integer;    // 0 ou rang jour f�ri�
function  GetNomFerie(rang:integer):string;     // nom jour f�ri�
function  GetDateFerie(D:TDateTime; rang:integer):TDateTime; // date f�ri�
function  GetRangNieme(D:TDateTime):integer;    // rang jour de sem dans mois
function  GetRowSem(D:TDateTime):integer;       // ligne de Semaine pour tableau
function  RangJourduMois(D:TDateTime):integer;  // pour Tableau de mois
function  ProchainJour(D:TDateTime; js:integer):TDateTime; // prochain jour idem
procedure SetWeekend_SamDim;  // weekend samedi dimanche pour jours ouvres
procedure SetWeekend_DimLun;  // weekend dimanche lundi  pour jours ouvres
function  isWeekend(D:TDateTime):boolean; // true si D tombe un week end
// jours ouvr�s
function  isOuvre(D:TDateTime):boolean;   // true si jour ouvr�
function  PremjourOuvreduMois(D:TDateTime):TDateTime;
function  DernjourOuvreduMois(D:TDateTime):TDateTime;
function  OuvresMois(D:TDateTime):integer;       // nombre de jours ouvr�s
function  ResteOuvresMois(D:TDateTime):integer;  // nombre de jours
function  EcoulesOuvresMois(D:TDateTime):integer;// nombre de jours
function  OuvresAn(D:TDateTime):integer;         // nombre de jours
function  ResteOuvresAn(D:TDateTime):integer;    // nombre de jours
function  EcouleOuvresAn(D:TDateTime):integer;   // nombre de jours
function  DiffOuvres(D1,D2:TDateTime):integer;   // nombre de jours
function  DiffNonWeekend(D1,D2:TDateTime):integer; // nombre de jours
// donne true si l'ann�e contient deux jours f�ri�s tombant le m�me jour
function FerieDouble(D:TDateTime):boolean;
// Divers
function PassageHeureEte(D:TDateTime):boolean;
function PassageHeureHiver(D:TDateTime):boolean;
function Nombredor(D:TDateTime):integer;
function Epacte(D:TDateTime):integer;
function LDominicale(D:TDateTime):string;
function CycleSolaire(D:TDateTime):integer;
function jDay(D,T:TDateTime):double;
// affichage heure, minute
function TimeToHM(T:TDateTime; HTxt,MTxt:string):string;
function HMToTime(Tx,HTxt,MTxt:string):TDateTime;
// autres
procedure SetPays; // initialise pays

function datestring(x:TDateTime):string;
function Get_Saint(fDate: TDateTime): string;
// retourne horaire civil, nautique, astronomique du lever et coucher du soleil
function Get_SunTime(gDate:TDateTime; Lat: Double; Lon: Double): THSunRecord;

implementation

Const
  // nombre de jours f�ri�s en France  // @@@@ ldp  NombreFeries = 14;
  NombreFeries = 15;
  // nom des jours f�ri�s              // @@@@ ldp  NomJF: array [1..14] of string[20]
  NomJF: array [1..15] of string[20] = (
    'Jour de l''an','P�ques','Lundi de P�ques','F�te du Travail','Anniversaire 1945',
    'Ascension','Pentec�te','Lundi de Pentec�te','F�te nationale','Assomption',
    'Toussaint','Armistice 1918','No�l','F�te des M�res','F�te des P�res');

  // Codification de la date des f�tes sur 5 caract�res
  // Dmmjj = Date fixe  mm = mois jj = jour
  // P+-nn = P�ques+-nn jours et P = P�ques
  // 1DI01 = premier Dimanche de Janvier  1 = premier, 9 = dernier
  // 1LU09 = premier lundi de septembre   2 = second, 3 troisi�me
  // 1LU11 = premier lundi de novembre
  // 9JE11 = dernier jeudi de novembre

  // date du jour f�ri�                // @@@@ ldp  DateJF: array[1..14] of string[5]
  DateJF: array[1..15] of string[5] = (
    'D0101',  //  1 Jour de l''an
    'P    ',  //  2 P�ques
    'P+01 ',  //  3 Lundi de P�ques
    'D0501',  //  4 F�te du Travail
    'D0508',  //  5 Anniversaire 1945
    'P+39 ',  //  6 Ascension
    'P+49 ',  //  7 Pentec�te
    'P+50 ',  //  8 Lundi de Pentec�te  // @@@@ ldp
    'D0714',  //  9 F�te Nationale
    'D0815',  // 10 Assomption
    'D1101',  // 11 Toussaint
    'D1111',  // 12 Armistice 1918
    'D1225',  // 13 No�l
    '9DI05',  // 14 f�te des m�res 9 toujours en dernier
    '3DI06'); // 15 f�te des p�res

  // le code du jour est bas� sur le mois * 100 + le num�ro du jour
// nota: vous pouvez en ajouter mais pensez � modifier le nb d'enregistrements
// 1052 enregistrements 0 � 1051
TablSaint: array[0..1051,0..1] of string = (
      (  '701', 'Aaron'),
      (  '805', 'Abel'),
      (  '805', 'Abella'),
      ( '1220', 'Abraham'),
      (  '512', 'Achille'),
      ( '1204', 'Ada'),
      ( '1216', 'Ad�la�de'),
      ( '1224', 'Ad�le'),
      ( '1020', 'Adeline'),
      (  '911', 'Adelphe'),
      (  '908', 'Adrien'),
      (  '908', 'Adrienne'),
      (  '205', 'Agathe'),
      (  '121', 'Agn�s'),
      ( '1018', 'Aimable'),
      (  '913', 'Aim�'),
      (  '220', 'Aim�e'),
      (  '909', 'Alain'),
      (  '622', 'Alban'),
      (  '622', 'Albane'),
      ( '1115', 'Albert'),
      ( '1115', 'Alberte'),
      ( '1115', 'Albertine'),
      (  '301', 'Albin'),
      (  '426', 'Alda'),
      (  '404', 'Al�the'),
      (  '404', 'Alette'),
      (  '422', 'Alexandra'),
      (  '422', 'Alexandre'),
      (  '109', 'Alexia'),
      (  '217', 'Alexis'),
      (  '611', 'Aleyde'),
      (  '815', 'Alfred'),
      ( '1216', 'Alice'),
      (  '426', 'Alida'),
      ( '1020', 'Aline'),
      (  '109', 'Alix'),
      (  '621', 'Alo�s'),
      (  '801', 'Alphonse'),
      (  '801', 'Alphosine'),
      (  '524', 'Ama�l'),
      ( '1104', 'Amance'),
      (  '206', 'Amand'),
      (  '709', 'Amandine'),
      (  '115', 'Amaury'),
      ( '1207', 'Ambroise'),
      (  '913', 'Am�'),
      (  '827', 'Am�d�'),
      (  '330', 'Am�d�e'),
      (  '919', 'Am�lie'),
      (  '331', 'Amos'),
      (  '809', 'Amour'),
      (  '726', 'Ana�s'),
      (  '310', 'Anastasie'),
      (  '203', 'Anatole'),
      (  '924', 'Andoche'),
      ( '1130', 'Andr�'),
      ( '1130', 'Andr�e'),
      (  '505', 'Ange'),
      (  '127', 'Ang�le'),
      (  '127', 'Ang�lique'),
      (  '417', 'Anicet'),
      (  '726', 'Anita'),
      (  '726', 'Annabelle'),
      (  '726', 'Anne'),
      (  '610', 'Anne-Marie'),
      (  '726', 'Annette'),
      (  '726', 'Annick'),
      (  '726', 'Annie'),
      (  '325', 'Annonciade'),
      (  '726', 'Anouchka'),
      (  '726', 'Anouk'),
      (  '421', 'Anselme'),
      (  '626', 'Anthelme'),
      (  '117', 'Anthony'),
      (  '705', 'Antoine'),
      (  '613', 'Antoine de Padou'),
      (  '705', 'Antoinette'),
      (  '502', 'Antonin'),
      (  '209', 'Apoline'),
      (  '912', 'Apollinaire'),
      (  '125', 'Apollos'),
      (  '801', 'Arcadius'),
      (  '801', 'Arcady'),
      (  '918', 'Ariane'),
      ( '1001', 'Arielle'),
      (  '831', 'Aristide'),
      (  '717', 'Arlette'),
      ( '1223', 'Armand'),
      ( '1223', 'Armande'),
      (  '816', 'Armel'),
      (  '816', 'Armelle'),
      (  '210', 'Arnaud'),
      (  '814', 'Arnold'),
      (  '718', 'Arnould'),
      (  '719', 'Ars�ne'),
      ( '1104', 'Arthur'),
      (  '815', 'Assomption'),
      ( '1127', 'Astrid'),
      (  '502', 'Athanase'),
      (  '910', 'Aubert'),
      (  '707', 'Aubierge'),
      (  '301', 'Aubin'),
      ( '1118', 'Aude'),
      (  '623', 'Audrey'),
      ( '1113', 'Augusta'),
      (  '229', 'Auguste'),
      (  '527', 'Augustin'),
      (  '828', 'Augustin'),
      ( '1113', 'Augustine'),
      ( '1004', 'Aure'),
      ( '1015', 'Aur�le'),
      ( '1015', 'Aur�lie'),
      (  '616', 'Aur�lien'),
      ( '1213', 'Aurore'),
      (  '422', 'Axel'),
      (  '503', 'Axel'),
      (  '422', 'Axelle'),
      (  '529',  'Aymar'),
      ( '1104',  'Aymeric'),
      ( '1117',  'Babette'),
      (  '331',  'Babine'),
      (  '624',  'Baptiste'),
      ( '1204',  'Barbara'),
      ( '1204',  'Barbe'),
      ( '1204',  'Barberine'),
      (  '611',  'Barnab�'),
      (  '123',  'Barnard'),
      (  '824',  'Barth�l�my'),
      (  '824',  'Bartolome'),
      (  '102',  'Basile'),
      (  '120',  'Bastien'),
      (  '130',  'Bathylle'),
      ( '1017',  'Baudouin'),
      (  '213',  'B�atrice'),
      (  '316',  'B�n�dicte'),
      (  '204',  'B�n�rice'),
      (  '331',  'Benjamin'),
      (  '331',  'Benjamine'),
      (  '711',  'Beno�t'),
      (  '416',  'Beno�t-Jos�'),
      (  '416',  'Beno�t-Joseph'),
      (  '526',  'B�renger'),
      (  '526',  'B�reng�re'),
      (  '218',  'Bernadette'),
      (  '820',  'Bernard de Clairvaux'),
      (  '615',  'Bernard de Menthon'),
      (  '520',  'Bernardin'),
      (  '704',  'Berthe'),
      ( '1106',  'Bertille'),
      ( '1016',  'Bertrand de Comminges'),
      (  '906',  'Bertrand de Garriques'),
      (  '321',  'B�rylo'),
      ( '1117',  'Bettina'),
      ( '1117',  'Betty'),
      ( '1030',  'Bienvenue'),
      (  '110',  'Billy'),
      (  '203',  'Blaise'),
      ( '1003',  'Blanche'),
      (  '602',  'Blandine'),
      ( '1005',  'Bluette'),
      (  '605',  'Boniface'),
      (  '502',  'Boris'),
      ( '1218',  'Briac'),
      ( '1113',  'Brice'),
      (  '501',  'Brieuc'),
      (  '723',  'Brigitte'),
      ( '1006',  'Bruno'),
      ( '1014',  'Calliste'),
      (  '714',  'Camille'),
      ( '1003',  'Candide'),
      ( '1005',  'Capucine'),
      ( '1107',  'Carine'),
      ( '1104',  'Carl'),
      ( '1104',  'Carlos'),
      (  '716',  'Carmen'),
      (  '717',  'Carole'),
      (  '717',  'Caroline'),
      (  '304',  'Casimir'),
      ( '1125',  'Cathel'),
      ( '1125',  'Catherine'),
      (  '429',  'Catherine de Sienne'),
      (  '324',  'Catherine de Su�de'),
      ( '1122',  'C�cile'),
      (  '107',  'C�dric'),
      ( '1014',  'C�leste'),
      (  '519',  'C�lestin'),
      ( '1122',  'C�lia'),
      ( '1021',  'C�line'),
      (  '826',  'C�sar'),
      (  '112',  'C�sarine'),
      ( '1212',  'Chantal'),
      ( '1104',  'Charles'),
      (  '302',  'Charles Le Bon'),
      (  '717',  'Charlotte'),
      ( '1104',  'Charly'),
      (  '724',  'Christel'),
      (  '724',  'Christelle'),
      ( '1112',  'Christian'),
      (  '724',  'Christiane'),
      (  '724',  'Christine'),
      (  '821',  'Christophe'),
      ( '1108',  'Clair de Tours'),
      ( '1102',  'Clair du Dauphin�'),
      (  '811',  'Claire'),
      (  '811',  'Clara'),
      (  '812',  'Clarisse'),
      (  '215',  'Claude'),
      (  '215',  'Claudette'),
      (  '606',  'Claudette'),
      (  '606',  'Claudia'),
      (  '215',  'Claudie'),
      (  '606',  'Claudie'),
      (  '606',  'Claudine'),
      (  '215',  'Claudius'),
      (  '713',  'Cl�lia'),
      (  '321',  'Cl�mence'),
      ( '1123',  'Cl�ment'),
      ( '1123',  'Cl�mentine'),
      (  '604',  'Clotilde'),
      (  '825',  'Clovis'),
      (  '306',  'Colette'),
      ( '1206',  'Colin'),
      ( '1231',  'Colombe'),
      (  '926',  'C�me'),
      ( '1126',  'Conrad'),
      ( '1212',  'Conrentin'),
      (  '408',  'Constance'),
      (  '923',  'Constant'),
      (  '521',  'Constantin'),
      (  '518',  'Cora'),
      (  '518',  'Coralie'),
      ( '1212',  'Corentine'),
      (  '518',  'Corinne'),
      ( '1025',  'Cr�pin'),
      (  '916',  'Cyprien'),
      (  '808',  'Cyraique'),
      (  '318',  'Cyrille'),
      ( '1005',  'Dahlia'),
      ( '1116',  'Daisy'),
      (  '926',  'Damien'),
      ( '1211',  'Daniel'),
      ( '1211',  'Dani�le'),
      ( '1211',  'Dany'),
      ( '1025',  'Daria'),
      ( '1229',  'David'),
      (  '920',  'Davy'),
      (  '921',  'D�borah'),
      ( '1102',  'D�funts'),
      ( '1224',  'Delphin'),
      ( '1126',  'Delphine'),
      ( '1009',  'Denis'),
      (  '515',  'Denise'),
      (  '508',  'D�sir�'),
      (  '609',  'Diane'),
      (  '523',  'Didier'),
      ( '1113',  'Di�go'),
      (  '701',  'Dietrich'),
      (  '810',  'Dieudonn�'),
      ( '1026',  'Dimitri'),
      (  '701',  'Dirk'),
      (  '915',  'Dolor�s'),
      (  '808',  'Dominique'),
      (  '507',  'Domitile'),
      (  '721',  'Domnin'),
      (  '715',  'Donald'),
      (  '524',  'Donatien'),
      ( '1109',  'Dora'),
      ( '1025',  'Doria'),
      ( '1109',  'Dorine'),
      (  '206',  'Doris'),
      (  '206',  'Doroth�e'),
      (  '708',  'Edgard'),
      (  '916',  'Edith'),
      ( '1120',  'Edm�e'),
      ( '1120',  'Edmond'),
      (  '105',  'Edouard'),
      (  '105',  'Edouardine'),
      ( '1016',  'Edwige'),
      ( '1208',  'Efli'),
      ( '1120',  'Egma'),
      (  '801',  'El�azar'),
      (  '624',  'El�onore'),
      ( '1208',  'Elfried'),
      (  '704',  'Eliane'),
      (  '720',  'Elie'),
      (  '720',  'Eliette'),
      (  '818',  'Eline'),
      ( '1117',  'Elisabeth'),
      ( '1117',  'Elise'),
      (  '614',  'Elis�e'),
      (  '201',  'Ella'),
      (  '201',  'Ell�nita'),
      ( '1022',  'Elodie'),
      ( '1201',  'Eloi'),
      (  '312',  'Elph�ge'),
      ( '1117',  'Elsa'),
      ( '1117',  'Elsy'),
      (  '716',  'Elvire'),
      ( '1027',  'Emeline'),
      ( '1104',  'Emeric'),
      (  '522',  'Emile'),
      (  '919',  'Emilie'),
      ( '1112',  'Emilien'),
      ( '1105',  'Emilienne'),
      (  '419',  'Emma'),
      ( '1225',  'Emmanuel'),
      ( '1225',  'Emmanuelle'),
      ( '1025',  'Enguerran'),
      (  '713',  'Enrique'),
      (  '609',  'Ephrem'),
      (  '518',  'Eric'),
      (  '518',  'Erich'),
      (  '518',  'Erika'),
      ( '1107',  'Ernest'),
      ( '1107',  'Ernestine'),
      (  '519',  'Erwan'),
      (  '519',  'Erwin'),
      ( '1226',  'Esteban'),
      (  '511',  'Estelle'),
      (  '701',  'Esther'),
      ( '1226',  'Etienne'),
      (  '417',  'Etienne'),
      (  '511',  'Etoile'),
      (  '713',  'Eug�ne'),
      (  '207',  'Eug�nie'),
      ( '1001',  'Eurielle'),
      (  '802',  'Eus�be'),
      (  '906',  'Eva'),
      (  '906',  'Evelyne'),
      (  '814',  'Evrard'),
      (  '120',  'Fabien'),
      (  '120',  'Fabienne'),
      ( '1227',  'Fabiola'),
      (  '822',  'Fabrice'),
      (  '309',  'Fanchon'),
      ( '1226',  'Fanny'),
      (  '215',  'Faustin'),
      (  '218',  'Favien'),
      (  '307',  'F�licie'),
      (  '609',  'F�licien'),
      (  '307',  'F�licit�'),
      (  '212',  'F�lix'),
      (  '530',  'Ferdinand'),
      (  '627',  'Fernand'),
      (  '627',  'Fernande'),
      (  '616',  'Ferr�ol'),
      (  '830',  'Fiacre'),
      (  '424',  'Fid�le'),
      ( '1011',  'Firmin'),
      (  '507',  'Flavie'),
      ( '1005',  'Fleur'),
      ( '1124',  'Flora'),
      ( '1201',  'Florence'),
      (  '704',  'Florent'),
      ( '1024',  'Florentin'),
      (  '504',  'Florian'),
      (  '501',  'Florine'),
      (  '427',  'Fortunat'),
      ( '1209',  'Fourier'),
      (  '309',  'France'),
      ( '1004',  'Francelin'),
      (  '309',  'Franceline'),
      (  '309',  'Francette'),
      (  '309',  'Francine'),
      ( '1004',  'Francis'),
      ( '1004',  'Francisque'),
      ( '1004',  'Fran�ois d''Assise'),
      (  '124',  'Fran�ois de Sales'),
      (  '309',  'Fran�oise'),
      ( '1222',  'Fran�oise-Xavi�re'),
      ( '1203',  'Fran�ois-Xavier'),
      ( '1004',  'Frank'),
      ( '1004',  'Frankie'),
      (  '718',  'Freddy'),
      (  '718',  'Fr�d�ric'),
      (  '718',  'Fr�d�rique'),
      (  '718',  'Frida'),
      (  '410',  'Fulbert'),
      (  '219',  'Gabin'),
      (  '929',  'Gabriel'),
      (  '929',  'Gabrielle'),
      (  '929',  'Gaby'),
      ( '1217',  'Ga�l'),
      ( '1217',  'Ga�lle'),
      (  '707',  'Ga�tan'),
      (  '807',  'Ga�tan'),
      (  '707',  'Ga�tane'),
      ( '1228',  'Gaspard'),
      (  '206',  'Gaston'),
      ( '1218',  'Gatien'),
      (  '720',  'Gaud'),
      (  '409',  'Gautier'),
      (  '103',  'Genevi�ve'),
      ( '1108',  'Geoffrey'),
      ( '1108',  'Geoffroy'),
      (  '423',  'Georges'),
      (  '215',  'Georgette'),
      (  '423',  'Georgette'),
      (  '215',  'Georgia'),
      (  '215',  'Georgine'),
      (  '423',  'Georgine'),
      ( '1205',  'G�rald'),
      ( '1205',  'G�raldine'),
      ( '1003',  'G�rard'),
      ( '1013',  'G�raud'),
      (  '528',  'Germain'),
      (  '615',  'Germaine'),
      (  '930',  'G�ronima'),
      ( '1116',  'Gertrude'),
      (  '619',  'Gervais'),
      (  '619',  'Gervaise'),
      (  '811',  'G�ry'),
      ( '1010',  'Ghislain'),
      ( '1010',  'Ghislaine'),
      (  '607',  'Gilbert'),
      (  '811',  'Gilberte'),
      (  '129',  'Gildas'),
      (  '901',  'Gilles'),
      (  '621',  'Gina'),
      (  '103',  'Ginette'),
      (  '621',  'Gino'),
      (  '420',  'Giraud'),
      (  '507',  'Gis�le'),
      (  '329',  'Gladys'),
      ( '1108',  'Godefroy'),
      (  '328',  'Gontran'),
      (  '621',  'Gonzague'),
      (  '701',  'Goulven'),
      (  '821',  'Gr�ce'),
      (  '821',  'Gracieuse'),
      (  '821',  'Graziella'),
      (  '903',  'Gr�goire'),
      (  '903',  'Gr�gory'),
      (  '303',  'Gu�nol�'),
      (  '819',  'Guerric'),
      ( '1018',  'Guewen'),
      (  '110',  'Guillaume'),
      (  '110',  'Guillemette'),
      ( '1007',  'Gustave'),
      (  '612',  'Guy'),
      (  '612',  'Guyonne'),
      ( '1103',  'Gw�na�l'),
      ( '1103',  'Gw�na�lle'),
      ( '1014',  'Gwendoline'),
      ( '1018',  'Gwenn'),
      (  '303',  'Gw�nola'),
      (  '327',  'Habib'),
      ( '1227',  'Hans'),
      ( '1101',  'Harold'),
      (  '713',  'Harry'),
      ( '1223',  'Hartmann'),
      (  '818',  'H�l�ne'),
      (  '818',  'H�li�na'),
      (  '720',  'H�lyette'),
      (  '713',  'Henri'),
      (  '713',  'Henriette'),
      (  '320',  'Herbert'),
      (  '828',  'Hermance'),
      (  '925',  'Hermann'),
      (  '828',  'Herm�s'),
      (  '709',  'Hermine'),
      (  '617',  'Herv�'),
      (  '113',  'Hilaire'),
      ( '1117',  'Hilda'),
      (  '813',  'Hippolyte'),
      (  '116',  'Honnorat'),
      (  '516',  'Honor�'),
      (  '227',  'Honorine'),
      ( '1005',  'Hortense'),
      ( '1103',  'Hubert'),
      (  '401',  'Hugues'),
      (  '401',  'Huguette'),
      (  '325',  'Humbert'),
      (  '817',  'Hyacinthe'),
      (  '713',  'Hyppolyte'),
      (  '203',  'Iadine'),
      (  '413',  'Ida'),
      (  '203',  'Idir'),
      ( '1017',  'Ignace'),
      (  '731',  'Ignace de Loyola'),
      (  '605',  'Igor'),
      ( '1104',  'Imr�'),
      (  '910',  'In�s'),
      (  '902',  'Ingrid'),
      ( '1228',  'Innocent'),
      (  '405',  'Ir�ne'),
      (  '628',  'Ir�n�e'),
      (  '904',  'Iris'),
      (  '709',  'Irma'),
      (  '904',  'Irma de Su�de'),
      ( '1220',  'Isaac'),
      (  '222',  'Isabelle'),
      (  '509',  'Isa�e'),
      (  '404',  'Isidore'),
      ( '1227',  'Ivan'),
      (  '624',  'Ivan'),
      ( '1212',  'Ivanne'),
      (  '530',  'Ivanne'),
      (  '407',  'J.B. de la Salle'),
      (  '130',  'Jacinthe'),
      (  '624',  'Jack'),
      (  '208',  'Jackie'),
      (  '503',  'Jacky'),
      (  '503',  'Jacme'),
      ( '1220',  'Jacob'),
      ( '1128',  'Jacques de la M.'),
      (  '725',  'Jacques(le majeur)'),
      (  '503',  'Jacques(le mineur)'),
      (  '208',  'Jacquette'),
      (  '208',  'Jacquine'),
      (  '725',  'Jacquine'),
      (  '208',  'Jacquotte'),
      (  '725',  'James'),
      (  '302',  'Jaoen'),
      (  '208',  'Jaqueline'),
      ( '1005',  'Jasmine'),
      ( '1023',  'Jean de Capistan'),
      (  '308',  'Jean de Damas'),
      (  '819',  'Jean Eudes'),
      ( '1227',  'Jean l''Ap�tre'),
      (  '624',  'Jean-Baptiste'),
      (  '616',  'Jean-Fran�ois R�gis'),
      (  '804',  'Jean-Marie Vianney'),
      (  '508',  'Jeanne'),
      (  '513',  'Jeanne d''Arc'),
      ( '1212',  'Jeanne de Chantal'),
      ( '1212',  'Jeanne F.C.'),
      (  '508',  'Jeannine'),
      (  '530',  'Jeannine'),
      (  '530',  'Jenny'),
      (  '501',  'J�r�mie'),
      (  '930',  'J�r�me'),
      ( '1104',  'Jessica'),
      ( '1104',  'Jessy'),
      (  '503',  'Jim'),
      (  '726',  'Joachim'),
      (  '726',  'Joanna'),
      (  '713',  'Jo�l'),
      (  '713',  'Jo�lle'),
      (  '302',  'Jo�vin'),
      (  '530',  'Johanne'),
      (  '624',  'John'),
      ( '1227',  'Johnny'),
      (  '213',  'Jordane'),
      (  '726',  'Joris'),
      (  '319',  'Jos�'),
      (  '319',  'Joseph'),
      (  '319',  'Jos�phine'),
      (  '319',  'Josette'),
      (  '319',  'Josiane'),
      ( '1213',  'Josse'),
      ( '1213',  'Josselin'),
      ( '1213',  'Josseline'),
      ( '1213',  'Josselyne'),
      (  '901',  'Josu�'),
      (  '430',  'Juanita'),
      ( '1028',  'Jude'),
      ( '1217',  'Judica�l'),
      (  '505',  'Judith'),
      (  '412',  'Jules'),
      (  '408',  'Julie'),
      (  '802',  'Julien'),
      (  '216',  'Julienne'),
      (  '518',  'Juliette d''Ancyre'),
      (  '730',  'Juliette de C�sar�e'),
      ( '1014',  'Juste'),
      (  '601',  'Justin'),
      (  '312',  'Justine'),
      (  '503',  'Juv�nal'),
      ( '1107',  'Karelle'),
      ( '1107',  'Karen'),
      ( '1107',  'Karine'),
      (  '324',  'Karine'),
      ( '1125',  'Katel'),
      ( '1125',  'Katia'),
      ( '1125',  'Katy'),
      ( '1125',  'Ketty'),
      (  '603',  'K�vin'),
      (  '814',  'Kobe'),
      ( '1125',  'Kurt'),
      (  '914',  'La Sainte Croix'),
      (  '729',  'Ladislas'),
      (  '818',  'La�titia'),
      (  '917',  'Lambert'),
      (  '610',  'Landry'),
      (  '326',  'Lara'),
      (  '326',  'Larissa'),
      (  '810',  'Laure'),
      (  '810',  'Laurence'),
      (  '810',  'Laurent'),
      (  '810',  'Laurentine'),
      (  '810',  'Laurette'),
      (  '810',  'Laurie'),
      (  '223',  'Lazare'),
      (  '729',  'Lazare de B�thanie'),
      (  '322',  'L�a'),
      ( '1002',  'L�ger'),
      (  '322',  'L�ia'),
      (  '818',  'L�na'),
      (  '818',  'L�na�c'),
      ( '1110',  'L�on'),
      ( '1106',  'L�onard'),
      (  '618',  'L�once'),
      ( '1110',  'L�one'),
      ( '1110',  'L�onilde'),
      ( '1110',  'L�ontine'),
      ( '1115',  'L�opold'),
      ( '1117',  'Leslie'),
      (  '322',  'Lia'),
      (  '414',  'Lidwine'),
      (  '322',  'Lila'),
      (  '704',  'Lilian'),
      (  '704',  'Liliane'),
      ( '1117',  'Lily'),
      (  '828',  'Linda'),
      ( '1020',  'Line'),
      ( '1117',  'Lisbeth'),
      ( '1117',  'Lise'),
      ( '1117',  'Lisette'),
      ( '1117',  'Lizzie'),
      ( '1201',  'Lo�c'),
      (  '825',  'Lo�c'),
      (  '621',  'Lo�s'),
      (  '915',  'Lola'),
      (  '915',  'Lolita'),
      (  '530',  'Lorraine'),
      (  '825',  'Louis de France'),
      (  '621',  'Louis de Gonzaque'),
      (  '315',  'Louise'),
      (  '428',  'Louis-Marie'),
      (  '729',  'Loup'),
      ( '1018',  'Luc'),
      ( '1018',  'Lucas'),
      ( '1213',  'Lucette'),
      ( '1213',  'Lucie'),
      (  '108',  'Lucien'),
      (  '108',  'Lucienne'),
      (  '216',  'Lucille'),
      (  '315',  'Lucr�ce'),
      (  '916',  'Ludmilla'),
      (  '825',  'Ludovic'),
      (  '825',  'Ludwic'),
      (  '825',  'Ludwig'),
      (  '803',  'Lydiane'),
      (  '803',  'Lydie'),
      (  '524',  'Ma�l'),
      (  '524',  'Ma�lle'),
      (  '720',  'Magalie'),
      (  '720',  'Maggy'),
      ( '1024',  'Magloire'),
      (  '607',  'Ma�t�'),
      ( '1115',  'Malo'),
      ( '1225',  'Mano�l'),
      ( '1225',  'Manuel'),
      (  '425',  'Marc'),
      (  '116',  'Marceau'),
      (  '116',  'Marcel'),
      (  '131',  'Marcelle'),
      (  '406',  'Marcellin'),
      (  '717',  'Marcelline'),
      (  '825',  'Marcien'),
      (  '720',  'Marguerite'),
      ( '1116',  'Marguerite d''Ecosse'),
      ( '1016',  'Marguerite-Marie'),
      (  '815',  'Mariam'),
      (  '709',  'Marianne'),
      (  '815',  'Mariannick'),
      (  '101',  'Marie'),
      (  '815',  'Marie'),
      (  '101',  'Marielle'),
      (  '815',  'Marielle'),
      (  '722',  'Marie-Madelaine'),
      (  '506',  'Marien'),
      (  '607',  'Marie-Th�r�se'),
      (  '706',  'Marietta'),
      (  '706',  'Mariette'),
      (  '815',  'Mariline'),
      (  '904',  'Marin'),
      (  '720',  'Marina'),
      (  '720',  'Marinette'),
      (  '815',  'Marion'),
      (  '119',  'Marius'),
      (  '815',  'Marjolaine'),
      (  '720',  'Marjorie'),
      (  '101',  'Marl�ne'),
      (  '815',  'Marl�ne'),
      (  '729',  'Marthe'),
      (  '630',  'Martial'),
      ( '1111',  'Martin'),
      (  '130',  'Martine'),
      (  '702',  'Martinien'),
      (  '815',  'Marylise'),
      (  '815',  'Maryse'),
      (  '815',  'Maryvonne'),
      (  '914',  'Materne'),
      (  '314',  'Mathilde'),
      (  '514',  'Matthias'),
      (  '921',  'Matthieu'),
      ( '1101',  'Maturin'),
      (  '314',  'Maud'),
      (  '922',  'Maurice'),
      (  '922',  'Mauricette'),
      (  '414',  'Maxime'),
      (  '814',  'Maximilien'),
      (  '312',  'Maximilien de Th�veste'),
      (  '529',  'Maximin'),
      (  '720',  'May'),
      (  '511',  'Mayeul'),
      (  '608',  'M�dard'),
      (  '106',  'M�laine'),
      (  '126',  'M�lanie'),
      (  '607',  'M�riadec'),
      (  '929',  'Michel'),
      (  '929',  'Mich�le'),
      (  '929',  'Micheline'),
      (  '929',  'Mika�l'),
      (  '713',  'Mildred'),
      (  '815',  'Mil�ne'),
      (  '522',  'Miloud'),
      (  '815',  'Mireille'),
      (  '224',  'Modeste'),
      (  '904',  'Mo�se'),
      (  '827',  'Monique'),
      (  '922',  'Morvan'),
      (  '904',  'Mosh�'),
      (  '501',  'Muguet'),
      (  '501',  'Muguette'),
      (  '815',  'Muriel'),
      (  '815',  'Myriam'),
      ( '1005',  'Myrtille'),
      (  '918',  'Nad�ge'),
      (  '218',  'Nadette'),
      (  '918',  'Nadia'),
      (  '218',  'Nadine'),
      (  '918',  'Nadine'),
      ( '1201',  'Nahum'),
      (  '726',  'Nancy'),
      ( '1029',  'Narcisse'),
      (  '826',  'Natacha'),
      (  '727',  'Nathalie'),
      (  '824',  'Nathana�l'),
      (  '824',  'Nathana�lle'),
      (  '908',  'Nativit� N.D.'),
      ( '1225',  'Nello'),
      ( '1225',  'Nelly'),
      (  '818',  'Nelly'),
      (  '512',  'N�r�e'),
      (  '226',  'Nestor'),
      ( '1206',  'Nicolas'),
      ( '1206',  'Nicole'),
      (  '306',  'Nicole'),
      ( '1206',  'Nicoletta'),
      (  '306',  'Nicoletta'),
      (  '131',  'Nikita'),
      ( '1206',  'Nils'),
      (  '114',  'Nina'),
      ( '1215',  'Ninon'),
      ( '1110',  'No�'),
      ( '1225',  'NO�L'),
      ( '1225',  'No�lle'),
      (  '821',  'No�mi'),
      (  '706',  'Nolwenn'),
      (  '606',  'Norbert'),
      (  '211',  'Notre Dame de Lourdes'),
      (  '716',  'Notre Dame du Mont Carmel'),
      ( '1120',  'Octave'),
      ( '1120',  'Octavie'),
      (  '806',  'Octavien'),
      (  '420',  'Odette'),
      ( '1214',  'Odile'),
      (  '104',  'Odilon'),
      (  '729',  'Olave'),
      (  '711',  'Olga'),
      (  '305',  'Olive'),
      (  '305',  'Olivette'),
      (  '305',  'Olivia'),
      (  '712',  'Olivier'),
      (  '821',  'Ombeline'),
      (  '909',  'Omer'),
      (  '501',  'Oreste'),
      ( '1004',  'Orianne'),
      (  '203',  'Oscar'),
      (  '805',  'Oswald'),
      ( '1116',  'Otmar'),
      (  '221',  'P. Damien'),
      ( '1004',  'Paco'),
      (  '509',  'Pac�me'),
      (  '216',  'Pamela'),
      (  '216',  'Pamphile'),
      (  '126',  'Paola'),
      (  '629',  'Paolo'),
      ( '1005',  'P�querette'),
      (  '309',  'Paquita'),
      ( '1004',  'Paquito'),
      (  '418',  'Parfait'),
      (  '517',  'Pascal'),
      (  '517',  'Pascale'),
      (  '517',  'Pascaline'),
      (  '415',  'Paterne'),
      (  '317',  'Patrice'),
      (  '317',  'Patricia'),
      (  '317',  'Patrick'),
      (  '125',  'Paul'),
      (  '629',  'Paul'),
      (  '126',  'Paula'),
      (  '126',  'Paule'),
      (  '126',  'Paulette'),
      (  '111',  'Paulin'),
      (  '126',  'Pauline'),
      (  '108',  'Peggy'),
      ( '1008',  'P�lagie'),
      (  '810',  'P�lagie'),
      ( '1016',  'Perlette'),
      (  '531',  'Pernelle'),
      (  '531',  'P�roline'),
      (  '307',  'Perp�tue'),
      (  '531',  'Perrette'),
      (  '531',  'Perrine'),
      ( '1005',  'Pervenche'),
      (  '629',  'Peter'),
      (  '531',  'P�tronille'),
      ( '1214',  'Phil�mon'),
      (  '820',  'Philibert'),
      (  '820',  'Philiberte'),
      (  '503',  'Philippe'),
      (  '813',  'Philom�ne'),
      ( '1209',  'Pierre'),
      (  '629',  'Pierre'),
      ( '1221',  'Pierre C'),
      (  '531',  'Pierrette'),
      (  '629',  'Pierrick'),
      ( '1005',  'Placide'),
      (  '312',  'Pol'),
      (  '223',  'Polycarpe'),
      (  '202',  'Pr�sentation'),
      ( '1121',  'Pr�sentation Vierge Marie'),
      (  '515',  'Prima�l'),
      (  '118',  'Prisca'),
      (  '116',  'Priscilla'),
      (  '821',  'Privat'),
      (  '625',  'Prosper'),
      (  '506',  'Prudence'),
      ( '1031',  'Quentin'),
      (  '522',  'Quiterie'),
      (  '115',  'Rachel'),
      ( '1123',  'Rachilde'),
      (  '813',  'Radegonde'),
      (  '617',  'Rainier'),
      (  '905',  'Ra�ssa'),
      (  '621',  'Ralph'),
      (  '707',  'Ralph'),
      (  '707',  'Raoul'),
      (  '929',  'Rapha�l'),
      (  '929',  'Rapha�lle'),
      (  '107',  'Raymond'),
      (  '107',  'Raymonde'),
      (  '323',  'R�becca'),
      (  '917',  'R�ginald'),
      (  '907',  'R�gine'),
      (  '616',  'R�gis'),
      (  '916',  'R�gnault'),
      (  '907',  'Reine'),
      (  '907',  'R�jane'),
      (  '115',  'R�mi'),
      (  '917',  'Renald'),
      (  '917',  'Renaud'),
      ( '1019',  'Ren�'),
      ( '1019',  'Ren�e'),
      (  '403',  'Richard'),
      (  '522',  'Rita'),
      (  '430',  'Robert'),
      (  '430',  'Roberte'),
      (  '430',  'Robin'),
      (  '816',  'Roch'),
      (  '621',  'Rodolphe'),
      (  '313',  'Rodrigue'),
      (  '524',  'Rogatien'),
      ( '1230',  'Roger'),
      (  '915',  'Roland'),
      (  '513',  'Rolande'),
      (  '228',  'Romain'),
      ( '1210',  'Romaric'),
      (  '225',  'Rom�o'),
      (  '619',  'Romuald'),
      (  '917',  'Ronald'),
      (  '601',  'Ronan'),
      (  '430',  'Roparz'),
      (  '904',  'Rosalie'),
      (  '117',  'Rosaline'),
      (  '823',  'Rose'),
      (  '823',  'Rose de l''Eglantine'),
      (  '117',  'Roseline'),
      (  '430',  'Rosemonde'),
      (  '823',  'Rosette'),
      (  '311',  'Rosine'),
      (  '823',  'Rosita'),
      (  '823',  'Rosy'),
      (  '823',  'Rozenn'),
      (  '621',  'Rudy'),
      (  '614',  'Rufin'),
      (  '829',  'Sabine'),
      (  '829',  'Sabrina'),
      (  '830',  'Sacha'),
      ( '1022',  'Salom�'),
      (  '318',  'Salvatore'),
      (  '728',  'Samson'),
      (  '820',  'Samuel'),
      (  '820',  'Samy'),
      (  '402',  'Sandie'),
      (  '402',  'Sandra'),
      (  '402',  'Sandrine'),
      ( '1109',  'Sara'),
      ( '1129',  'Saturnin'),
      (  '120',  'S�bastien'),
      (  '724',  'S�gol�ne'),
      (  '421',  'Selma'),
      ( '1012',  'S�raphin'),
      ( '1007',  'Serge'),
      ( '1007',  'Sergine'),
      (  '701',  'Servan'),
      (  '701',  'Servane'),
      ( '1127',  'S�verin'),
      ( '1127',  'S�verine'),
      ( '1122',  'Sh�ila'),
      ( '1009',  'Sibille'),
      ( '1114',  'Sidoine'),
      ( '1114',  'Sidonie'),
      (  '822',  'Siegfried'),
      (  '501',  'Sigismond'),
      (  '724',  'Sigol�ne'),
      (  '620',  'Silv�re'),
      (  '218',  'Sim�on'),
      ( '1028',  'Simon'),
      ( '1028',  'Simone'),
      ( '1004',  'Soizic'),
      (  '510',  'Solange'),
      ( '1011',  'Sol�dad'),
      ( '1017',  'Solenne'),
      ( '1017',  'Soline'),
      (  '918',  'Sonia'),
      (  '525',  'Sophie'),
      (  '411',  'Stanislas'),
      (  '511',  'Stella'),
      ( '1226',  'St�phane'),
      ( '1226',  'St�phanie'),
      ( '1226',  'St�ve'),
      (  '811',  'Suzanne'),
      (  '811',  'Suzel'),
      (  '811',  'Suzette'),
      (  '811',  'Suzon'),
      (  '811',  'Suzy'),
      (  '320',  'Svetlana'),
      (  '504',  'Sylvain'),
      (  '504',  'Sylvaine'),
      ( '1231',  'Sylvestre'),
      ( '1105',  'Sylvette'),
      ( '1105',  'Sylviane'),
      ( '1105',  'Sylvie'),
      (  '822',  'Symphorien'),
      (  '501',  'Tamara'),
      ( '1119',  'Tanguy'),
      (  '112',  'Tania'),
      (  '112',  'Tatiana'),
      (  '112',  'Tatienne'),
      ( '1028',  'Teddy'),
      (  '105',  'Teddy'),
      ( '1109',  'Teddy'),
      ( '1217',  'Tessa'),
      ( '1028',  'Thadd�e'),
      (  '924',  'Th�cle'),
      ( '1109',  'Th�odore'),
      (  '202',  'Th�ophane'),
      ( '1220',  'Th�ophile'),
      ( '1015',  'Th�r�sa'),
      (  '128',  'Th�r�se dAquin'),
      ( '1015',  'Th�r�se d''Avila'),
      ( '1001',  'Th�r�se de l''Enfant J�sus'),
      (  '708',  'Thibaut'),
      (  '708',  'Thi�baud'),
      (  '701',  'Thierry'),
      (  '703',  'Thomas'),
      (  '214',  'Tino'),
      (  '106',  'Tiphaine'),
      (  '228',  'Toinon'),
      ( '1101',  'Toussaint'),
      (  '806',  'Transfiguration'),
      ( '1201',  'Tudal'),
      (  '509',  'Tudy'),
      (  '710',  'Ulrich'),
      ( '1219',  'Urbain'),
      ( '1001',  'Urielle'),
      ( '1021',  'Ursula'),
      ( '1021',  'Ursule'),
      (  '214',  'Valentin'),
      (  '725',  'Valentine'),
      (  '614',  'Val�re'),
      (  '428',  'Val�rie'),
      (  '401',  'Val�ry'),
      (  '204',  'Vanessa'),
      (  '530',  'Vanina'),
      (  '102',  'Vassili'),
      (  '928',  'Venceslas'),
      (  '918',  'V�ra'),
      ( '1111',  'V�rane'),
      (  '204',  'V�ronique'),
      ( '1115',  'Victoire'),
      (  '721',  'Victor'),
      (  '323',  'Victorien'),
      (  '515',  'Victorin'),
      (  '515',  'Victorine'),
      (  '122',  'Vincent'),
      (  '927',  'Vincent de Paul'),
      (  '911',  'Vinciane'),
      ( '1005',  'Violaine'),
      ( '1005',  'Violette'),
      ( '1010',  'Virgile'),
      (  '107',  'Virginie'),
      (  '201',  'Viridiana'),
      (  '531',  'Visitation'),
      (  '602',  'Vital'),
      (  '310',  'Vivian'),
      ( '1202',  'Viviane'),
      (  '310',  'Vivien'),
      (  '409',  'Walter'),
      (  '419',  'Werner'),
      ( '1012',  'Wilfried'),
      (  '110',  'William'),
      (  '110',  'Willy'),
      ( '1106',  'Winnoc'),
      (  '715',  'Wladimir'),
      ( '1031',  'Wolfgang'),
      (  '320',  'Wulfran'),
      ( '1203',  'Xavier'),
      ( '1222',  'Xavi�re'),
      (  '624',  'Yann'),
      (  '624',  'Yannick'),
      (  '624',  'Yoann'),
      (  '611',  'Yolande'),
      (  '615',  'Yolande'),
      (  '423',  'Youri'),
      (  '624',  'Yvan'),
      (  '519',  'Yves'),
      (  '113',  'Yvette'),
      (  '519',  'Yvon'),
      (  '519',  'Yvonne'),
      ( '1105',  'Zacharie'),
      ( '1017',  'Z�lie'),
      ( '1011',  'Z�naide'),
      ( '1220',  'Z�phirin'),
      (  '427',  'Zita'),
      (  '502',  'Zo�'));

var
  Weekend: integer; // type de weekend : 0 = sam + dim,  1 = dim + lun
  // tables jours f�ri�s utilis�es pour un pays donn� et une ann�e
  // Nombreferies = rang maxi utilis� dans ces tableaux pour le pays en cours
  JoursFeries: array[1..16] of TDateTime; // dates jours f�ri�s de l'ann�e+1 pour tri
  RangFeries : array[1..16] of integer;   // rang du nom f�ri� dans NOMJF
  CodifFeries: array[1..16] of string[5]; // codif date f�ri�s pour pays
  Oldaa : word;  // m�morise l'ann�e pour optimiser calcul jours f�ri�s

// fonction pour calculs de date
// retourne l'ann�e
function GetAnnee(D: TDateTime): integer;
var AA,MM,JJ: Word;
begin DecodeDate(D,AA,MM,JJ); result:= AA; end;

// retourne le mois
function GetMois(D: TDateTime): integer;
var AA,MM,JJ: Word;
begin DecodeDate(D,AA,MM,JJ); result:= MM; end;

// retourne le jour
function GetJour(D: TDateTime): integer;
var AA,MM,JJ: Word;
begin DecodeDate(D,AA,MM,JJ); result:= JJ; end;

// retourne le 01 janvier de l'ann�e demand�e
function DateDebAnnee(D: TDateTime): TDateTime;
var AA,MM,JJ: Word;
begin
  DecodeDate(D,AA,MM,JJ); result:= EncodeTime(0,0,0,0); result:= EncodeDate(AA,1,1);
end;

// retourne le 31 d�cembre de l'ann�e demand�e
function DateFinAnnee(D: TDateTime): TDateTime;
var AA,MM,JJ: Word;
begin
  DecodeDate(D,AA,MM,JJ); result:= EncodeTime(0,0,0,0); result:= EncodeDate(AA,12,31);
end;

// retourne le num�ro de jour dans l'ann�e 1..365 ou 366
function NumerodeJour(D: TDateTime): integer;
begin result:= Trunc(D - DateDebAnnee(D)) + 1; end;

// retourne le 1er du mois
function DateDebMois(D: TDateTime): TDateTime;
var AA,MM,JJ: Word;
begin
  DecodeDate(D,AA,MM,JJ); result:= EncodeTime(0,0,0,0); result:= EncodeDate(AA,MM,1);
end;

// retourne le jour de la fin du mois
function DateFinMois(D: TDateTime): TDateTime;
var AA,MM,JJ: Word;
begin
  // premier du mois suivant et - 1 jour
  DecodeDate(D,AA,MM,JJ);
  if MM = 12 then begin Inc(AA); MM:= 1; end else Inc(MM);
  result:= EncodeTime(0,0,0,0);  result:= EncodeDate(AA,MM,1) - 1;
end;

// retourne le num�ro de la semaine
function NumeroSemaine(D: TDateTime): integer;
const t1: array[1..7] of ShortInt = (-1, 0, 1, 2, 3,-3,-2);
      t2: array[1..7] of ShortInt = (-4, 2, 1, 0,-1,-2,-3);
var Nbj1,Nbj2: integer; DebutAA: TDateTime;
begin
  DebutAA:= DateDebAnnee(D);
  Nbj1:= NumeroDeJour(D) + t1[DayOfWeek(DebutAA)];
  Nbj2:= NumeroDeJour(D) + t2[DayOfWeek(D)];
  if Nbj1 <= 0 then result:= NumeroSemaine(DebutAA - 1)
  else
    if (Nbj2 >= NumeroDeJour(DateFinAnnee(D))) then result:= 1
    else result:= (Nbj1-1) div 7 + 1;
end;

// retourne la date du lundi
function DateDebSemaine(D: TDateTime): TDateTime;
begin while DayOfWeek(D) <> 2 do D:= IncremJour(D,-1); result:= D; end;

// retourne la date du dimanche
function DateFinSemaine(D: TDateTime): TDateTime;
begin while DayOfWeek(D) <> 1 do D:= IncremJour(D, 1); result:= D; end;

// retourne True si l'ann�e est bissextile
function Bissextile(D: TDateTime): Boolean;
var AA,MM,JJ: Word;
begin
  DecodeDate(D,AA,MM,JJ);
  result:= (AA mod 4 = 0) and ((AA mod 100 <> 0) or (AA mod 400 = 0));
end;

// retourne le nombre de jours dans l'ann�e
function NombreJoursAnnee(D: TDateTime): integer;
begin if Bissextile(D) then result:= 366 else result:= 365; end;

// retourne le nombre de semaines dans l'ann�e
function NombreSemainesAnnee(D: TDateTime): integer;
var Vtp: TDateTime;
begin
  Vtp:= DateFinAnnee(D); while NumeroSemaine(Vtp) < 50 do Vtp:= Vtp - 1;
  result:= Numerosemaine(Vtp);
end;

// retourne la date du d�but du trimestre
function DateDebTrimestre(D: TDateTime):TDateTime;
var AA,MM,JJ: Word;
begin
  DecodeDate(D,AA,MM,JJ);  result:= EncodeTime(0,0,0,0);
  result:= EncodeDate(AA,((MM-1 div 3) * 3) + 1,1);
end;

// retourne la date de fin du trimestre
function DateFinTrimestre(D: TDateTime): TDateTime;
begin result:= DateDebTrimestre(DateDeBtrimestre(D)+(3 * 31)) - 1; end;

// num�ro du jour de semaine,Lun = 1,dim = 7 ald Dim = 1,sam = 7 utilis� par DayofWeek
function JourDeSemaine(D: TDateTime): integer;
var js: integer;
begin js:= DayOfWeek(D) - 1; if js = 0 then js:= 7; result:= js; end;

// retourne le nombre de jours dans le mois
function JoursDansMois(D: TDateTime): integer;
const JJdansMM: array[1..12] of Byte = (31,28,31,30,31,30,31,31,30,31,30,31);
var MM: integer;
begin
  MM:= GetMois(D); result:= JJdansMM[MM]; if (MM=2) and Bissextile(D) then inc(result);
end;

// incr�mente les ann�es
function IncremAnnee(D: TDateTime; waa: integer): TDateTime;
var AA,MM,JJ: word; Vtp: integer; DebNewAn: TDateTime;
begin
  if waa = 0 then begin result:= D; exit; end;
  Decodedate(D,AA,MM,JJ);  Vtp:= AA + waa; if Vtp < 0 then Vtp:= 1;
  AA:= Vtp; DebNewAn:= EncodeDate(aa,1,1);
  // correction pour le dernier jour de f�vrier
  if (MM = 2) and (JJ = 29) and (Bissextile(DebNewAn) = False) then JJ:= 28;
  result:= EncodeTime(0,0,0,0); result:= EncodeDate(AA,MM,JJ);
end;

// incr�mente les mois
function IncremMois(D: TDateTime; wmm: integer): TDateTime;
var AA,MM,JJ: word; Vtp: integer; Nouvmois: TDateTime;
begin
  if wmm = 0 then begin result:= D; exit; end;
  Decodedate(D,AA,MM,JJ); Vtp:= MM + wmm;
  while Vtp <  1 do begin Vtp:= Vtp + 12; dec(AA); end;
  while Vtp > 12 do begin Vtp:= Vtp - 12; inc(AA); end;
  MM:= Vtp;  Nouvmois:= EncodeDate(AA,MM,1);
  Vtp:= JoursDansMois(Nouvmois);
  // test si le jour ne d�passe pas le nombre de jours du mois
  if JJ > Vtp then jj:= Vtp;    if JJ < 1 then jj:= 1;
  result:= EncodeTime(0,0,0,0); result:= EncodeDate(AA,MM,JJ);
end;

// incr�mente les semaines
function IncremSem(D: TDateTime; wsem: integer): TDateTime;
begin result:= D + wsem * 7; end;

// incr�mente les jours
function IncremJour(D: TDateTime; wjj: integer): TDateTime;
begin result:= D + wjj; end;

// Dateser identique � DateSerial de visual basic. On peut faire :
// Decodedate(mydate,y,m,j) puis Newdate:= dateser(y+30,m-40,j+654)
// On accepte donc les param�tres wmm et wjj incorrects.
function DateSer(waa,wmm,wjj: integer): TDateTime;
begin result:= IncremMois(EncodeDate(waa,1,1), wmm -1) + wjj - 1; end;

// Diff�rence entre deux dates (D2 - D1) r�sultat alg�brique en jours
function DiffDates(D1, D2 : TDateTime): integer;
begin result:= trunc(D2) - trunc(D1); end;

// retourne True si les dates sont �gales
// programmer if D1 = D2 incorrect � cause des heures idem if round(D1) = round(D2)
function EgalDates(D1,D2: TDateTime): boolean;
begin result:= (trunc(D1) - trunc(D2) = 0); end;

// Diff�rence entre deux dates �dit�es en texte
function EditDiffDates(D1,D2: TDateTime): string;
var d,a1,m1,j1,a2,m2,j2: Longint; aa,mm,jj: word;
begin
  d:= trunc(D2) - trunc(D1);
  if D = -2 then result:= 'Avant hier'   else
  if D = -1 then result:= 'Hier'         else
  if D =  0 then result:= 'Aujourd''hui' else
  if D =  1 then result:= 'Demain'       else
  if D =  2 then result:= 'Apr�s demain'
  else begin
    if d > 0 then begin
      Decodedate(D1,aa,mm,jj); a1:= aa; m1:= mm; j1:= jj;
      Decodedate(D2,aa,mm,jj); a2:= aa; m2:= mm; j2:= jj;
      result:= 'dans';   end
    else begin
      Decodedate(D2,aa,mm,jj); a1:= aa; m1:= mm; j1:= jj;
      Decodedate(D1,aa,mm,jj); a2:= aa; m2:= mm; j2:= jj;
      result:= 'il y a'; end;
    m2:= (a2 - a1- 1) * 12 + m2 + 12 - m1; // dur�e en mois
    a2:= m2 div 12;  m2:= m2 - a2 * 12;
    if J2 >= J1 then j2:= j2 - j1
    else begin
      j2:= JoursDansMois(D1) - j1 + j2;  dec(m2);
      if m2 < 0 then begin dec(a2); m2:= 11; end;
      end;
    if a2 > 0 then begin
      result:= result + ' ' + IntToStr(a2) + ' an';
      if a2 > 1 then result:= result + 's';
      end;
    if (a2 > 0) and (m2 > 0) and (j2 <= 0) then result:= result + ' et';
    if m2 > 0 then result:= result + ' ' + IntToStr(m2) + ' mois';
    if (j2 > 0) and ((m2 > 0) or (a2 > 0)) then result:= result + ' et';
    if j2 > 0 then result:= result + ' ' + IntToStr(j2) + ' jour';
    if j2 > 1 then result:= result + 's';
  end;
end;

// Diff�rence de dates exprim�e en ann�es mois jours
// Si la diff�rence est n�gative les 3 r�sultats sont n�gatifs
procedure AAMMJJDiffDates(D1,D2: TDateTime; var waa,wmm,wjj: integer);
var d,a1,m1,j1,a2,m2,j2,sens: Longint; aa,mm,jj: word;
begin
  d:= trunc(D2) - trunc(D1);
  if d > 0 then begin
    Decodedate(D1,aa,mm,jj); a1:= aa; m1:= mm; j1:= jj;
    Decodedate(D2,aa,mm,jj); a2:= aa; m2:= mm; j2:= jj;
    sens:=  1;  end
  else begin
    Decodedate(D2,aa,mm,jj); a1:= aa; m1:= mm; j1:= jj;
    Decodedate(D1,aa,mm,jj); a2:= aa; m2:= mm; j2:= jj;
    sens:= -1;  end;
  m2:= (a2 - a1- 1) * 12 + m2 + 12 - m1; { dur�e en mois }
  a2:= m2 div 12;  m2:= m2 - a2 * 12;
  if J2 >= J1 then j2:= j2 - j1
  else begin
    j2:= JoursDansMois(D1) - j1 + j2;  dec(m2);
    if m2 < 0 then begin dec(a2); m2:= 11; end;
    end;
  waa:= a2 * sens; wmm:= m2 * sens; wjj:= j2 * sens;
end;

// diff�rence de dates exprim�e en mois
function DiffMois(D1, D2: TDateTime): integer;
var a1,m1,j1,a2,m2,j2: word; sens: integer;
begin
  if trunc(D2) >= trunc(D1) then begin
    Decodedate(D1,a1,m1,j1); Decodedate(D2,a2,m2,j2); sens:=  1; end
  else begin
    Decodedate(D2,a1,m1,j1); Decodedate(D1,a2,m2,j2); sens:= -1; end;
  result:= ((a2 - a1) * 12 + m2 - m1) * sens;
end;

// calcul du jour de P�ques
// nota: le jour de P�ques correspond au 1er dimanche apr�s la 1�re pleine lune
// de l'�quinoxe du printemps, les f�tes religieuses ch�tienns sont alors cal�es
// par rapport � P�ques sauf pour N�el
function Paques(D : TDateTime): TDateTime;
var AA,MM,JJ: Word; v1,v2,v3,v4,v5,v6,v7,v8,v9,v10,v11,v12,p: longint;
begin
  Decodedate(D,AA,MM,JJ);
  v1 := AA mod 19;           v2 := AA div 100;
  v3 := AA mod 100;          v4 := v2 div 4;
  v5 := v2 mod 4;            v6 := (8 + v2) div 25;
  v7 := (1+ v2 - v6) div 3;  v8 := 15 + 19 * v1+ v2 - v4 - v7;
  v8 := v8 mod 30;           v9 := v3 div 4;
  v10:= v3 mod 4;            v11:= 32 + 2 * (v5 + v9) - v8 - v10;
  v11:= v11 mod 7;           v12:= (v1+11* v8 + 22 * v11) div 451;
  p:= NumeroDeJour(EncodeDate(AA,3,21) + v8 + v11 - 7 * v12 + 1);
  result:= DateDebAnnee(d) + p - 1;
end;

// Calcul des jours f�ri�s pour l'ann�e correspondant � la date D
// M�morise l'ann�e dans oldaa pour ne pas refaire le calcul � chaque fois
// Les deux tableaux Jourferies et rang feries sont ensuite tri�s sur la date
// � cause des jours f�ri�s mobiles
procedure InitFeries(D: TDateTime);
var i,j,n,dn: integer; aa,mm,jj: word; DatePaques,Vtp: TDateTime;
    s: string[5]; TestChiffre: boolean;
begin
  n:=1;  dn:=1; // initialisation
  Decodedate(D, aa, mm, jj);
  if aa = oldaa then exit;
  oldaa:= aa;  DatePaques:= Paques(D);
  for i:= 1 to Nombreferies do begin
    JoursFeries[i]:= aujourdhui; // initialise
    s:= CodifFeries[i];
    if copy(s,1,1) = 'P' then begin
      Vtp:= DatePaques;
      if copy(s,2,1) = ' ' then n:= 0 else n:= StrToInt(copy(s,3,2));
      if copy(s,2,1) = '-' then n:= -n;
      Vtp:= Vtp + n;  JoursFeries[i]:= Vtp;
      end;
    if copy(s,1,1) = 'D' then begin
      mm:= StrToInt(copy(s,2,2)); jj:= StrToInt(copy(s,4,4));
      JoursFeries[i]:= EncodeTime(0,0,0,0); JoursFeries[i]:= EncodeDate(AA,MM,JJ);
      end;
    if s = '1erDI' then begin
      Vtp:= DateDebAnnee(D); while JourdeSemaine(Vtp) <> 7 do Vtp:= Vtp + 1;
      Joursferies[i]:= Vtp;
      end;
    // cas chiffre au d�but 3DI05
    TestChiffre:= False;
    if (copy(s,1,1) = '1') or (copy(s,1,1) = '2') or (copy(s,1,1) = '3')
      or (copy(s,1,1) = '4') or (copy(s,1,1) = '5') or (copy(s,1,1) = '9') then
      begin n:= StrToInt(copy(s,1,1)); TestChiffre:= true; end;
    if TestChiffre = true then begin
      if copy(s,2,2) = 'LU' then dn:= 1 else
      if copy(s,2,2) = 'MA' then dn:= 2 else
      if copy(s,2,2) = 'ME' then dn:= 3 else
      if copy(s,2,2) = 'JE' then dn:= 4 else
      if copy(s,2,2) = 'VE' then dn:= 5 else
      if copy(s,2,2) = 'SA' then dn:= 6 else
      if copy(s,2,2) = 'DI' then dn:= 7;
      mm:= StrToInt(copy(s,4,2)); Vtp:= EncodeDate(aa,mm,1);
      JoursFeries[i]:= NiemeJourduMois(Vtp,n,dn);
      end;
  end;
  // d�calage f�tes des m�res 9DI05 +1 sem et p�res 3DI06 +3 sem si d�j� f�ri�s
  for i:= 1 to Nombreferies - 2 do
    if CodifFeries[i] = '9DI05' then begin
      for j:= 2 to Nombreferies - 2 do
        if (JoursFeries[i] = JoursFeries[j]) and (CodifFeries[j] <> '9DI05') then
          begin JoursFeries[i]:= JoursFeries[j] +  7; Break; end;
      for j:= 2 to Nombreferies - 2 do begin
        if aa = 1998 then Break;                  // ann�e exception
        if (CodifFeries[j] = '3DI06') and ((JoursFeries[j] - JoursFeries[i]) < 21) then
          begin JoursFeries[j]:= JoursFeries[i] + 21; Break; end;
        end;
     end;
  // tri du Tableau Jourferies des dates de jours f�ri�s avec mise � jour
  // correspondante des Tableaux CodifFeries et RangFeries
  for i:= Nombreferies downto 1 do
    for j:= 1 to Nombreferies - 1 do
      if trunc(JoursFeries[j]) > trunc(JoursFeries[j + 1]) then begin
        JoursFeries[16] := JoursFeries[j]; JoursFeries[j]:= JoursFeries[j+1];
        JoursFeries[j+1]:= JoursFeries[16];
        CodifFeries[16] := CodifFeries[j]; CodifFeries[j]:= CodifFeries[j+1];
        CodifFeries[j+1]:= CodifFeries[16];
        RangFeries[16]  := RangFeries[j];  RangFeries[j] := RangFeries[j+1];
        RangFeries[j+1] := RangFeries[16];
        end;
end;

// retourne True si le jour est f�ri�
function isFerie(D: TDateTime): boolean;
var i: integer;
begin
  InitFeries(D);  result:= False;
  for i:= 1 to NombreFeries do begin
    if trunc(D) = trunc(JoursFeries[i]) then begin result:= True; break; end;
  end;
end;

// retourne True si l'ann�e contient deux jours f�ri�s tombant le m�me jour
function FerieDouble(D: TDateTime): boolean;
var i: integer;
begin
  InitFeries(D);  result:= False;
  for i:= 1 to NombreFeries - 1 do begin
    if trunc(JoursFeries[i]) = trunc(JoursFeries[i+1]) then
      begin result:= True; break; end;
    end;
end;

// retourne le rang du jour feri� dans la table des jours f�ri�s, si 2 f�tes
// tombent le m�me jour le rang de la seconde est multipli� par 100 et ajout�
// au rang de la premi�re f�te d�tect�e
function GetRangFerie(D: TDateTime): integer; // 0 si pas f�ri�
var i: integer;
begin
  InitFeries(D);  result:= 0;
  for i:= 1 to NombreFeries do begin
    if trunc(D) = trunc(JoursFeries[i]) then begin
      if result > 0 then result:= result + 100 * i else result:= i;
      end;
    end;
end;

// retourne le nom du jour f�ri�
// GetNomFerie:  Exemple d'utilisation f: integer; nf: string
//   f:= GetRangFerie(zdate);
//   if f > 0 then begin
//     nf:= GetNomFerie(f mod 100);
//     if f > 100 then nf:= nf + ', ' + GetNomFerie(f div 100);
//     end
//   else lib:= '';
function GetNomFerie(rang: integer): string;
begin
  Calenderreur:= 0;
  if (rang < 1) or (rang > NombreFeries) then
    begin Calenderreur:= 4; result:= ''; end
  else result:= NomJF[RangFeries[rang]];
end;

// retourne la date du jour f�ri�
function GetDateFerie(D: TDateTime; rang: integer): TDateTime;
begin
  Calenderreur:= 0;
  if (rang < 1) or (rang > NombreFeries) then
       begin Calenderreur:= 4; result:= DateDebAnnee(D);   end
  else begin initferies(D);    result:= JoursFeries[rang]; end;
end;

// Pour le mois en cours, NiemeJourduMois donne la date du ni�me jour de la
// Semaine (js). Les jours de la Semaine sont compatibles avec JourdeSemaine,
// Lundi = 1, ... , Dimanche = 7 Exemple: 3�me mardi(=2) de ce mois -> (Now,3,2)
// Si joursemaine est incorrect la fonction fournit le premier jour du mois et
// Calenderreur = 1. Si rang est < 1 on consid�re qu'il s'agit du rang 1
// Exemple: (now,8,2) donne le dernier mardi du mois car le rang 8 est trop �lev�.
// Pour indiquer ce d�passement, Calenderreur = 2
function NiemeJourduMois(D: TDateTime; rang, js: integer): TDateTime;
var Vtp: TDateTime;
begin
  Calenderreur:= 0;
  if (js < 1) or (js > 7) then begin
    result:= DateDebMois(D); Calenderreur:= 1; exit; end;
  Vtp:= DateDebMois(D); while JourDeSemaine(Vtp) <> js do Vtp:= Vtp + 1;
  if rang < 1 then rang:= 1;  if rang > 5 then rang:= 5;
  Vtp:= incremsem(Vtp, rang - 1);
  if GetMois(Vtp) <> GetMois(D) then begin
    Vtp:= DateFinMois(D); while JourDeSemaine(Vtp) <> js do Vtp:= Vtp -1;
    Calenderreur:= 2;
    end;
  result:= Vtp;
end;

function GetRangNieme(D: TDateTime): integer;
var Vtp: TDateTime; rang,js: integer;
begin
  js:= JourdeSemaine(D); Vtp:= DateDebMois(D); rang:= 0;
  repeat
    if JourdeSemaine(Vtp) = js then inc(rang);
    Vtp:= IncremJour(Vtp,1);
  until Vtp > D;
  result:= rang;
end;

// 2 fonctions pour un tableau mensuel [ jours  x semaines ]
// A utiliser avec un tableau: donne le rang de la semaine dans le mois 1..5
function GetRowSem(D: TDateTime): integer;
var TOffSet: integer;
begin
  Calenderreur:= 0; TOffSet:= JourdeSemaine(DateDebMois(D)) - 2;
  result:= 1 + (TOffSet + GetJour(D)) div 7;
end;

// Donne le rang du jour dans le mois 0..6
function  RangJourduMois(D: TDateTime): integer;
begin result:= (GetJour(D) - 1) div 7; end;

// Semaine js fourni en param�tre.  Lundi : Js = 1  .. Dimanche Js = 7
// Si js est incorrect fournit D et Calenderreur est mis � 1
// Exemple: Prochainjour(Aujourdhui,3) donne  Mercredi prochain
function  ProchainJour(D: TDateTime; js: integer): TDateTime;
var Vtp: TDateTime;
begin
  Calenderreur:= 0;   Vtp:= D + 1;
  if (js < 1) or (js > 7) then begin Calenderreur:= 1; result:= D; exit; end;
  while JourDeSemaine(Vtp) <> js do Vtp:= Vtp + 1;
  result:= Vtp;
end;

// calcul des jours de ouvr�s
// Un jour f�ri� correspond � une f�te l�gale religieuse ou civile.
// En France il existe 11 f�tes l�gales : 1er Janvier, lundi de p�ques, 1er Mai,
// 8 Mai, Ascension, Lundi de pentec�te, 14 juillet, 15 ao�t, 1er Novembre,
// 11 Novembre, 25 D�cembre Le Dimanche est le jour de repos hebdomadaire.
// Les Dimanches de P�ques et de Pentec�te qui ne sont pas f�ri�s, sont donc des
// f�tes tombant le jour de repos. Les jours ouvrables sont tous les jours de la
// semaine sauf les jours f�ri�s ch�m�s dans l'entreprise. Le repos hebdomadaire
// l�gal d�pend des conventions collectives. Nous ne traitons ici que les 2 cas
// suivants:  Weekend = 0  Repos hebdomadaire le samedi et le dimanche.
//            Weekend = 1  Repos hebdomadaire le dimanche et le lundi.
// jours ouvr�s = jours ouvrables hors repos hebdomadaire = jours de travail


procedure SetWeekend_SamDim;
begin weekend:= 0; end;

procedure SetWeekend_DimLun;
begin weekend:= 1; end;

function isWeekEnd(D: TDateTime): boolean;
var js,jsw: integer;
begin
  result:= False;  js:= JourDeSemaine(D);
  if weekend = 0 then jsw:= 6 else jsw:= 1;
  if (js = 7) or (js = jsw) then result:= True;
end;

function isOuvre(D : TDateTime) : boolean;
begin
  if isWeekEnd(D) or isFerie(D) then result:= False
  else result:= True;
end;

function PremjourOuvreduMois(D: TDateTime): TDateTime;
var Vtp: TDateTime;
begin
  Vtp:= DateDebMois(D); while isOuvre(Vtp) = False do Vtp:= Vtp + 1; result:= Vtp;
end;

function DernjourOuvreduMois(D : TDateTime): TDateTime;
var Vtp: TDateTime;
begin
  Vtp:= DateFinMois(D); while isOuvre(Vtp) = False do Vtp:= Vtp - 1; result:= Vtp;
end;

// nombre de jours ouvr�s du mois
function OuvresMois(D : TDateTime): integer;
begin result:= DiffOuvres(DateDebMois(D), DateFinMois(D)); end;

// nombre de jours ouvr�s restant non compris ce jour
function ResteOuvresMois(D: TDateTime): integer;
begin result:= DiffOuvres(D,DateFinMois(D)); end;

function EcoulesOuvresMois(D: TDateTime): integer;
begin result:= DiffOuvres(DateDebMois(D), D); end;

// nombre de jours ouvr�s dans l'ann�e
function OuvresAn(D: TDateTime): integer;
begin result:= DiffOuvres(DateDebAnnee(D),DateFinAnnee(D)); end;

// nombre de jours ouvres restant non compris le jour de la date D
function ResteOuvresAn(D: TDateTime): integer;
begin result:= DiffOuvres(D,DateFinAnnee(D)); end;

function EcouleOuvresAn(D : TDateTime): integer;
begin result:= DiffOuvres(DateDebAnnee(D),D); end;

function DiffOuvres(D1,D2: TDateTime): integer;
var Vtp,fin: TDateTime; ctr,sens: integer;
begin
  if trunc(D1) = trunc(D2) then begin
    if isOuvre(D1) then result:= 1 else result:= 0; exit; end;
  if D1 < D2 then begin Vtp:= D1; fin := D2; sens:= 1;  end
             else begin Vtp:= D2; fin := D1; sens:= -1; end;
  ctr:= 0;
  repeat
    if isOuvre(Vtp) then inc(ctr); Vtp:= Vtp + 1;
  until trunc(Vtp) > trunc(fin);
  result:= ctr * sens;
end;

function DiffNonWeekend(D1, D2 : TDateTime): integer;
var Vtp,fin: TDateTime; ctr,sens: integer;
begin
  if trunc(D1) = trunc(D2) then begin result:= 0; exit; end;
  if D1 < D2 then begin Vtp:= D1; fin := D2; sens:=  1; end
             else begin Vtp:= D2; fin := D1; sens:= -1; end;
  ctr:= 0;
  repeat
    if isWeekEnd(Vtp) = False then inc(ctr); Vtp:= Vtp + 1;
  until trunc(Vtp) > trunc(fin);
  result:= ctr * sens;
end;

// retourne age actuel en integer
function GetAge(D: TDateTime): integer;
begin result:= trunc((now - D) / 365.25); end;

// retourne age actuel en string
function GetAgeStr(D: TDateTime): string;
var diff: integer;
begin
  diff:= trunc((now - D) / 365.25); result:= IntToStr(diff);
  if diff > 1 then result:= result + ' ans' else result:= result + ' an';
end;
// retourne age futur en integer
function GetAgeFutur(DD,DF: TDateTime): integer;
begin result:= trunc((DF - DD) / 365); end;

// retourne age futur en string
function GetAgeStrFutur(DD,DF: TDateTime): string;
var diff: integer;
begin
  diff:= trunc((DF - DD) / 365);  result:= IntToStr(diff);
  if diff > 1 then result:= result + ' ans' else result:= result + ' an';
end;

// dernier dimanche de mars
function PassageHeureEte(D: TDateTime): boolean;
var Vtp: TDateTime;
begin
  Vtp:= EncodeDate(GetAnnee(D),3,31);  // le 31 mars
  while JourDeSemaine(Vtp) <> 7 do Vtp:= Vtp - 1;
  if D = Vtp then result:= True else result:= False;
end;

// dernier dimanche d'octobre
function PassageHeureHiver(D: TDateTime): boolean;
var Vtp: TDateTime;
begin
  Vtp:= EncodeDate(GetAnnee(D),10,31);  // le 31 octobre
  while JourDeSemaine(Vtp) <> 7 do Vtp:= Vtp - 1;
  if D = Vtp then result:= True else result:= False;
end;

// nombre d'or : nombre compris entre 1 et 19 qui indique le rang d'une ann�e donn�e
// dans un cycle de 19 ans au bout duquel les phases de la lune se reproduisent
// aux m�mes dates
// Ann�e tropique = 365,2422  jours.  ( r�volution terre autour du soleil )
// Mois synodique =  29,53059 jours.  ( r�volution lune autour de la terre )
// 19 ann�es tropiques = 234,997 mois synodiques soit presque 235
// 19 = cycle m�tonique  (M�ton, astronome grec 500 ans avant J.C.
function NombredOr(D: TDateTime): integer;
var aa: integer;
begin aa:= GetAnnee(D); result:= aa mod 19 + 1; end;

// L'Epacte indique l'�ge de la lune au premier janvier, c'est � dire le nombre
// de jours �coul�s depuis une nouvelle lune "officielle"
function Epacte(D: TDateTime): integer;
var epact: integer;
begin
  epact:= (11 * (NombredOr(D) - 1)) mod 30; epact:= epact - (3 * 20) div 4 ;
  epact:= epact + (8 * 20 + 5) div 25;      epact:= epact + 8;
  if epact <  1 then epact:= 30 + epact;
  if epact > 30 then epact:= epact - 30;
  result:= epact;
end;

// lettre dominicale. rang du premier dimanche de l'ann�e
function Ldominicale(D: TDateTime): string;
const LD = 'ABCDEFG';
var Vtp: TDateTime; i: integer;
begin
  Vtp:= EncodeDate(GetAnnee(D),1,1);
  while JourDeSemaine(Vtp) <> 7 do Vtp:= Vtp + 1;
  i:= GetJour(Vtp);  result:= copy(LD,i,1);
end;

// num�ro de l'ann�e dans la p�riode de 28 ans au bout de laquelle on retrouve
// les m�mes jours de la Semaine. faire + 8 sur l'ann�e.
// 365 j = 364 + 1 = 52 x 7 + 1. Chaque ann�e d�cale d'un jour de la semaine.
// Sans les ann�es bissextiles, il faudrait 7 ans pour retouver le m�me calendrier.
// A cause des ann�es bissextiles, il faut 7x4 = 28 ann�es.
function CycleSolaire(D: TDateTime): integer;
begin result:= ((GetAnnee(D) + 8) mod 28) + 1; end;

// retourne le num�ro du jour julien suivant le calendrier Gregorien
// apr�s le 04/10/1582, donn� a partir de : ann�e, mois, jour, heure, minute
function jday(D,T: TDateTime): double;
var a,b,c,e,m,y: double; An,Mo,Jr,Hr,Min,Sec,Msec: word;
begin
  DecodeDate(D,An,Mo,Jr); DecodeTime(T,Hr,Min,Sec,Msec);
  m:= Mo;   y:= An;
  if m <= 2 then begin m:= m + 12; y:= y - 1; end;
  if ((An < 1582) or ((An = 1582) and ((Mo < 9) or ((Mo = 9) and (Jr < 5)))))
    then b:= 0 else begin a:= trunc(y / 100);
  b:= 2 - a + trunc(a / 4); end;
  c:= trunc(365.25 * (y + 4716)); e:= trunc(30.6001 * (m + 1));
  result:= b + c + e + Jr - 1524.5 + ((Sec + Min * 60 + Hr * 3600) / 86400);
end;

// retourne un TDateTime en format (12:30 ou 12h30 suivant s�parateur)
function TimeToHM(T: TDateTime; HTxt,MTxt: string): string;
var Hour,Min,Sec,MSec: word;
begin
  DecodeTime(T,Hour,Min,Sec,MSec);
  if Hour < 10 then result:= '0' + IntToStr(hour)
               else result:= IntToStr(hour);
  result:= result + HTxt;
  if Min < 10 then result:= result + '0' + IntToStr(Min)
              else result:= result + IntToStr(Min);
  result:= result + MTxt;
end;

// retourne (12:30 ou 12h30 suivant s�parateur) en TDateTime
function HMToTime(Tx,HTxt,MTxt: string): TDateTime;
var Hour,Min,Ind,HPos,MPos: word;
begin
  for Ind:= 1 to length(Tx) do begin
    if copy(Tx,Ind,length(HTxt)) = HTxt then HPos:= Ind;
    if copy(Tx,Ind,length(MTxt)) = MTxt then MPos:= Ind;
    end;
  Hour:= StrToInt(copy(Tx,1,HPos-1));
  Min:= StrToInt(copy(Tx,HPos+length(HTxt),length(Tx)-HPos-length(HTxt)-length(MTxt)+1));
  result:= EncodeTime(Hour,Min,0,0);
end;

procedure SetPays;
var cptr: integer;
begin
  Calenderreur:= 0;
  for cptr:= 1 to NombreFeries do begin
    RangFeries[cptr]:= cptr; CodifFeries[cptr]:= DateJF[cptr];
    end;
end;

function datestring(x:TDateTime):string;
begin
  result:=formatdatetime('dd mmmm yyyy ',x)+formatdatetime('hh:nn',x)+' UTC';
end;

// retourne les saints du jour
function Get_Saint(fDate: TDateTime): string;
var Year, Month, Day, MsJr, Ind: word;
    TxtSaint: string;
    TheFirst: boolean;
    NumSaint: byte;
begin
  DecodeDate(fDate,Year,Month,Day);  MsJr:= Month * 100 + Day;
  TheFirst:= true;
  NumSaint := 0;
  for Ind:= low(TablSaint) to high(TablSaint) do
    begin
      if TablSaint[Ind,0] = IntToStr(MsJr) then
        begin
          Inc(NumSaint);
          if not TheFirst then
            begin
              if (NumSaint mod 2)=0 then
                TxtSaint:= TxtSaint + ', ' + TablSaint[Ind,1]
              else
                TxtSaint:= TxtSaint + ', '#13 + TablSaint[Ind,1];
            end
          else
            begin
              TxtSaint:= TablSaint[Ind,1];
              TheFirst:= false;
            end;
        end;
    end;
  result:= TxtSaint;
end;

function Get_SunTime(gDate: TDateTime; Lat: Double; Lon: Double): THSunRecord;
// AHvo  : angle horaire du soleil � 0h par rapport � Greenwich
// AHMLi : angle horaire du m�ridien du lieu d'observation
// AHMSo : angle horaire du m�ridien du soleil
// LVSo  : longitude vraie du soleil
// ASDSo : ascension droite du soleil
// DclSo : d�clinaison du soleil
// AziSo : azimut du soleil
// HSo   : hauteur du soleil au dessus de l'horizon
// AMSo  : anomalie moyenne du soleil

  /////////////////////// fonction internes //////////////////////////

  function Interval2PiRd(X:double):double;
  label Test2pi;
  begin
    Test2pi:
    if X < 0 then begin X:= X + Pi * 2; goto Test2pi; end;
    if (X = 2 * Pi) or (X > 2 * Pi) then begin X:= X - Pi * 2; goto Test2pi; end;
    result:= X;
  end;
  // fonction ArcSinus
  function ArcSin(X:double):double;
  begin result:= ArcTan( X / Sqrt(-X * X +1)); end;
  // fonction ArcCosinus
  function ArcCos(X:double):double;
  begin result:= ArcTan(-X / Sqrt(-X * X +1)) + ( Pi/2 ); end;
  // fonction de conversion heure d�cimale en heure, minute
  function HrDcToHrMn(X:double):double;
  var H,M: Byte;
  begin H:= Trunc(X); M:= Trunc(frac(X) * 60); result:= H + ( M/100 ); end;
  // fonction conversion valeur sexag�cimale en d�cimale
  function SexToDec(X:double):double;
  var Sign: ShortInt; H,M,S: Integer; Z: Double;
  begin
    if X < 0 then Sign:= -1 else Sign:= 1;
    X:= Abs(X + 0.00005);
    H:= Trunc(X); Z:= Frac(X) * 100;        // heure ou degr�s
    M:= Trunc(Z); S:= Trunc(Frac(Z) * 100); // minute seconde
    result:= (H + (M/60) + (S/3600)) * Sign;
  end;

  //////////////////////////////////////////////////////////////////////

var NumJrB, N, Crepuscule: Byte; Sign: ShortInt;
    gLonLieuDc, gLatLieuDc, gGMTLieu: Double;
    gLonLieuRd, gLatLieuRd, gGMTLieuHd: Double;
    AHMLiRd, AHvgRd, AMSo, LVSoRd, ASDSoRd, DclSoRd: Double;
    SinHSoRd, AziSoRd, TpsLRd, AHMSoRd, TpsTURd: Double;
    PtM,NumJr, Z, SinX, cosAz, TpsHRd, TpsHorlog, SW: Double;
    AAnnee, AMois, AJour, HrSol,MnSol: Word;
    PJAn, HorSol: TDateTime;
begin
  // nota: il suffit de changer les coordonn�es pour une autre ville
  // coordonn�es de Paris en degr� d�cimal
//  gLatLieuDc:= 48.50;  // latitude
//  gLonLieuDc:= -2.20;  // longitude
  gLatLieuDc:= Lat;  // latitude
  gLonLieuDc:= Lon;  // longitude
  gGMTLieu:= 1;        // d�calage horaire
  // coordonn�es de Paris en radian
  gLonLieuRd:= SexToDec(gLonLieuDc) * Pi/180;
  gLatLieuRd:= SexToDec(gLatLieuDc) * Pi/180;
  gGMTLieuHd:= SexToDec(gGMTLieu);
  // NumJr = n� du jour depuis le 0 janvier de l'ann�e en cours
  DecodeDate(gDate,AAnnee,AMois,Ajour);
  PJAn:= EncodeDate(AAnnee,1,1);
  NumJr:= gDate - PJAn + 1;
  // HrFusHd:= - gGMTLieuHd;     changement de signe du d�calage horaire
  // AHMLiRd:= HrFusHd * Pi/12;  angle horaire du m�ridien du lieu observation en rd
  // angle horaire en rad du m�ridien du lieu observation
  AHMLiRd:= -gGMTLieuHd * Pi/12;

  //////////// calcul du lever � Pi / 2 /////////////////////
  PtM:= Pi / 2;
  //temps approximatif = angle position soleil sur �cliptique suivant nb de jours
  //                   = nombre de jour + ((PtM + longitude ) / 2 * Pi)
  AHvgRd:= NumJr + ((PtM + gLonLieuRd) / (2 * Pi));
  // anomalie moyenne du soleil 1j -> 2 * Pi / 365,25 = 0,01720242383896
  // AMSo:= AMSo - 0.0574039;
  AMSo:= (AHvgRd * 2 * Pi / 365.25) - 0.0574039;
  // LVSo = longitude vraie du soleil
  LVSoRd:= AMSo + Sin(AMSo) * 0.0334405 + Sin(2*AMSo) * 0.000349066 + 4.93289;
  LVSoRd:= Interval2PiRd(LVSoRd); // intervalle 0-2Pi
  Z:= frac(LVSoRd / (Pi / 2));    // d�terminaison du cadran en divisant par Pi/2
  // si Z = 0 on ajoute 1s d'arc soit 0.00000484814 rd
  if Z = 0 Then LVSoRd:= LVSoRd + 0.00000484814;
  N:= 0;
  if LVSoRd > (Pi / 2)     then N:= 1;
  if LVSoRd > (3 * Pi / 2) then N:= 2;
  //////// ascension droite du soleil /////////
  // ASDSoRd = ArcTan(tan(LVSoRd) * cos(d�clinaison)
  // cos(d�clinaison) : cos 23�26,4' = 0.91746 // tan(LVSoRd)
  ASDSoRd:= sin(LVSoRd) / cos(LVSoRd);
  ASDSoRd:= ArcTan(ASDSoRd * 0.91746);
  // ajustement du cadran
  case N of
    0: ASDSoRd:= ASDSoRd;
    1: ASDSoRd:= ASDSoRd + Pi;
    2: ASDSoRd:= ASDSoRd + (Pi * 2);
    end;
  //////// d�clinaison du soleil /////////
  // DclSoRd = ArcSin(sin(LVSoRd) * sin(d�clinaison))
  // sin(d�clinaison) : sin 23�26,4' = 0.39782
  SinX:= sin(LVSoRd) * 0.39782;
  DclSoRd:= ArcSin(SinX);
  //////// conversion des coordonn�es //////////
  // cr�puscule lorsque le centre du soleil est en dessous de l'horizon
  // angle H = centre du soleil par rapport � l'horizon d'o� H < 0�
  // cr�puscule astronomique H = 18� cr�puscule nautique   H = 12�
  // cr�puscule civil        H = 6�  cr�puscule r�el       H = 0�50'
  // valeur du sin(H) suivant option choisie
  for Crepuscule:= 1 to 4 do begin
    SinHSoRd:= -0.0; // initialisation
    case Crepuscule of
      1: SinHSoRd:= -0.014543897651582; // HSo = - 0� 50'
      2: SinHSoRd:= -0.104528463267653; // HSo = - 6�
      3: SinHSoRd:= -0.207911690817759; // HSo = - 12�
      4: SinHSoRd:= -0.309016994374947; // HSo = - 18�
      end;
    cosAz:= SinHSoRd - (Sin(DclSoRd) * Sin(gLatLieuRd));
    cosAz:= cosAz / (Cos(DclSoRd) * Cos(gLatLieuRd));
    Z:= Abs(cosAz);
    if Z <= 1 then begin // ajustement  azimut du soleil
      AziSoRd:= ArcCos(cosAz);    // au coucher: Azi = arccos(cosAz)
      AziSoRd:= 2 * Pi - AziSoRd; // au lever  : Azi = 2 * pi - arccos(cosAz)
      // heure local apparent du noeud ascendant
      // ann�e tropique entre 2 �quinoxes = 365j 5h 48mn 45,975s
      // en jour d�cimal 365.24219878473 j
      Z:= AHvgRd * 2 * pi / 365.24219878473;
      TpsLRd:= AziSoRd + ASDSoRd - Z - 1.73364; // angle horaire local
      //AHMSoRd:= TpsLRd;
      TpsTURd:= TpsLRd + gLonLieuRd;       // temps universel
      TpsHRd:= TpsTURd - AHMLiRd;          // temps horloge
      Z:= Interval2PiRd(TpsHRd) * 12/Pi;   // D�cimal en sexag�simal: angle*12/Pi
      TpsHorlog:= HrDcToHrMn(Z);           // heure d�cimale en heure, minute
      HrSol:= Trunc(TpsHorlog); MnSol:= Round(frac(TpsHorlog)*100);
      HorSol:= EncodeTime(HrSol,MnSol,0,0);
      // affichage horaire
      case Crepuscule of
        1: HSun.SAubeReel:= HorSol;
        2: HSun.SAubeCivi:= HorSol;
        3: HSun.SAubeNaut:= HorSol;
        4: HSun.SAubeAstr:= HorSol;
        end;
      end
    else TpsHorlog:= 0;
  end;

  ///////////// calcul du coucher � 3/2 de Pi ////////////////
  PtM:= Pi * 3 / 2;
  AHvgRd:= NumJr + ((PtM + gLonLieuRd) / (2 * Pi));
  AMSo:= (AHvgRd * 2 * Pi / 365.25) - 0.0574039;
  LVSoRd:= AMSo + Sin(AMSo)*0.0334405 + Sin(2*AMSo)*0.000349066 + 4.93289;
  LVSoRd:= Interval2PiRd(LVSoRd);
  Z:= frac(LVSoRd / (Pi / 2)); if Z = 0 then LVSoRd:= LVSoRd + 0.00000484814;
  N:= 0;
  if LVSoRd > (Pi / 2) then N:= 1;  if LVSoRd > (3 * Pi / 2) then N:= 2;
  ASDSoRd:= sin(LVSoRd) / cos(LVSoRd);  ASDSoRd:= ArcTan(ASDSoRd * 0.91746);
  case N of
    0: ASDSoRd:= ASDSoRd;
    1: ASDSoRd:= ASDSoRd + Pi;
    2: ASDSoRd:= ASDSoRd + (2 * Pi);
    end;
  SinX:= sin(LVSoRd) * 0.39782;  DclSoRd:= ArcSin(SinX);
  for Crepuscule:= 1 to 4 do begin
    case Crepuscule of
      1: SinHSoRd:= -0.014543897651582;  2: SinHSoRd:= -0.104528463267653;
      3: SinHSoRd:= -0.207911690817759;  4: SinHSoRd:= -0.309016994374947;
      end;
    cosAz:= SinHSoRd - (Sin(DclSoRd) * Sin(gLatLieuRd));
    cosAz:= cosAz / (Cos(DclSoRd) * Cos(gLatLieuRd));
    Z:= Abs(cosAz);
    if Z <= 1 then begin
      AziSoRd:= ArcCos(cosAz);
      // AziSoRd:= 2 * Pi - AziSoRd;
      Z:= AHvgRd * 2 * pi / 365.24219878473;
      TpsLRd:= AziSoRd + ASDSoRd - Z - 1.73364;
      //AHMSoRd:= TpsLRd;
      TpsTURd:= TpsLRd + gLonLieuRd;
      TpsHRd:= TpsTURd - AHMLiRd;
      Z:= Interval2PiRd(TpsHRd) * 12/Pi;
      TpsHorlog:= HrDcToHrMn(Z);
      HrSol:= Trunc(TpsHorlog);
      MnSol:= Round(frac(TpsHorlog)*100);
      HorSol:= EncodeTime(HrSol,MnSol,0,0);
      case Crepuscule of
        1: HSun.SCrepReel:= HorSol;
        2: HSun.SCrepCivi:= HorSol;
        3: HSun.SCrepNaut:= HorSol;
        4: HSun.SCrepAstr:= HorSol;
        end;
      end
    else TpsHorlog:= 0;
  end;
  result:= HSun;
end;

// initialisation 
Initialization
  aujourdhui:= now; weekend:= 0; oldaa:= 1; setpays;

end.

