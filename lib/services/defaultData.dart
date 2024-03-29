import 'QuestionAnimalsDBModel.dart';
import 'QuestionCalculesDBModel.dart';
import 'QuestionGeometryDBModel.dart';
import 'StatisticsDBModel.dart';

final List<QuestionCalculesDBModel> defaultCalcules = [
  QuestionCalculesDBModel(level: 1, numberA: '12', numberB: '10', answer: 1),
  QuestionCalculesDBModel(level: 1, numberA: '4', numberB: '7', answer: -1),
  QuestionCalculesDBModel(level: 1, numberA: '2+5', numberB: '5+2', answer: 0),
  QuestionCalculesDBModel(level: 1, numberA: '0', numberB: '3', answer: -1),
  QuestionCalculesDBModel(level: 1, numberA: '11', numberB: '111', answer: -1),
  QuestionCalculesDBModel(level: 1, numberA: '42', numberB: '39', answer: 1),
  QuestionCalculesDBModel(level: 1, numberA: '82', numberB: '78', answer: 1),
  QuestionCalculesDBModel(level: 1, numberA: '18', numberB: '56', answer: -1),
  QuestionCalculesDBModel(level: 1, numberA: '9+1', numberB: '11', answer: -1),
  QuestionCalculesDBModel(level: 1, numberA: '15', numberB: '8+7', answer: 0),
  QuestionCalculesDBModel(
      level: 1, numberA: '18+3', numberB: '11+9', answer: 1),
  QuestionCalculesDBModel(level: 1, numberA: '14+9', numberB: '25', answer: -1),
  QuestionCalculesDBModel(level: 1, numberA: '11', numberB: '111', answer: -1),
  QuestionCalculesDBModel(
      level: 1, numberA: '3+6', numberB: '12+2', answer: -1),
  QuestionCalculesDBModel(
      level: 1, numberA: '1+1', numberB: '1+10', answer: -1),
  QuestionCalculesDBModel(
      level: 1, numberA: '101+9', numberB: '17+8', answer: 1),
  QuestionCalculesDBModel(level: 1, numberA: '7+9', numberB: '12+4', answer: 0),
  QuestionCalculesDBModel(
      level: 1, numberA: '14+12', numberB: '5+18', answer: 1),
  QuestionCalculesDBModel(level: 1, numberA: '9+5', numberB: '11', answer: 1),
  QuestionCalculesDBModel(level: 1, numberA: '9', numberB: '3+3+3', answer: 0),
  QuestionCalculesDBModel(level: 1, numberA: '69', numberB: '6+9', answer: 1),
  QuestionCalculesDBModel(level: 1, numberA: '21', numberB: '7+7+7', answer: 0),
  QuestionCalculesDBModel(
      level: 1, numberA: '18+10', numberB: '16+12', answer: 0),
  QuestionCalculesDBModel(
      level: 1, numberA: '100', numberB: '90+10', answer: 0),
  QuestionCalculesDBModel(level: 1, numberA: '4', numberB: '1+1+0', answer: 1),
  QuestionCalculesDBModel(level: 1, numberA: '19', numberB: '09', answer: 1),
  QuestionCalculesDBModel(
      level: 1, numberA: '25+3', numberB: '13+7', answer: 1),
  QuestionCalculesDBModel(
      level: 1, numberA: '4+4+4', numberB: '3+7+2', answer: 0),
  QuestionCalculesDBModel(level: 1, numberA: '101', numberB: '99', answer: 1),
  QuestionCalculesDBModel(level: 1, numberA: '050', numberB: '005', answer: 1),
  QuestionCalculesDBModel(level: 2, numberA: '10', numberB: '9+1', answer: 0),
  QuestionCalculesDBModel(level: 2, numberA: '1+1', numberB: '5', answer: -1),
  QuestionCalculesDBModel(level: 2, numberA: '15', numberB: '150', answer: -1),
  QuestionCalculesDBModel(level: 2, numberA: '03', numberB: '3', answer: 0),
  QuestionCalculesDBModel(level: 2, numberA: '2*2', numberB: '2+2', answer: 0),
  QuestionCalculesDBModel(level: 2, numberA: '5-5', numberB: '2+5', answer: -1),
  QuestionCalculesDBModel(
      level: 2, numberA: '10-1', numberB: '3+3+3', answer: 0),
  QuestionCalculesDBModel(level: 2, numberA: '12', numberB: '20-8', answer: -1),
  QuestionCalculesDBModel(
      level: 2, numberA: '2*2*2', numberB: '2+2+2', answer: 1),
  QuestionCalculesDBModel(
      level: 2, numberA: '1*1*1', numberB: '1+1+1', answer: -1),
  QuestionCalculesDBModel(
      level: 2, numberA: '20-7', numberB: '10+3', answer: 0),
  QuestionCalculesDBModel(level: 2, numberA: '5*5', numberB: '7+14', answer: 1),
  QuestionCalculesDBModel(
      level: 2, numberA: '36-10', numberB: '4*3', answer: -1),
  QuestionCalculesDBModel(level: 2, numberA: '24-8', numberB: '8*2', answer: 0),
  QuestionCalculesDBModel(level: 2, numberA: '77', numberB: '100*0', answer: 1),
  QuestionCalculesDBModel(level: 2, numberA: '4*2', numberB: '4*4', answer: -1),
  QuestionCalculesDBModel(
      level: 2, numberA: '1-1', numberB: '15-15', answer: 0),
  QuestionCalculesDBModel(
      level: 2, numberA: '20-14', numberB: '2*6', answer: -1),
  QuestionCalculesDBModel(level: 2, numberA: '37-8', numberB: '3*9', answer: 1),
  QuestionCalculesDBModel(
      level: 2, numberA: '21-7-2', numberB: '0*77', answer: 1),
  QuestionCalculesDBModel(
      level: 2, numberA: '24+8', numberB: '40+2', answer: -1),
  QuestionCalculesDBModel(
      level: 2, numberA: '1+29', numberB: '58-17', answer: -1),
  QuestionCalculesDBModel(
      level: 2, numberA: '01+33', numberB: '8-2-1', answer: 1),
  QuestionCalculesDBModel(level: 2, numberA: '3*3', numberB: '14-7', answer: 1),
  QuestionCalculesDBModel(
      level: 2, numberA: '3*13', numberB: '35*0*9', answer: 1),
  QuestionCalculesDBModel(
      level: 2, numberA: '48-3', numberB: '9*1*5', answer: 0),
  QuestionCalculesDBModel(
      level: 2, numberA: '04*18', numberB: '24*3', answer: 0),
  QuestionCalculesDBModel(
      level: 2, numberA: '10+8-9', numberB: '33-22', answer: -1),
  QuestionCalculesDBModel(
      level: 2, numberA: '9*11', numberB: '2*27', answer: 1),
  QuestionCalculesDBModel(
      level: 2, numberA: '13*4', numberB: '5*12', answer: -1),
  QuestionCalculesDBModel(
      level: 3, numberA: '100', numberB: '100*2-9', answer: -1),
  QuestionCalculesDBModel(level: 3, numberA: '19-4', numberB: '5*3', answer: 0),
  QuestionCalculesDBModel(
      level: 3, numberA: '1', numberB: '2*1*1-1', answer: 0),
  QuestionCalculesDBModel(
      level: 3, numberA: '101', numberB: '1000/10+2', answer: -1),
  QuestionCalculesDBModel(
      level: 3, numberA: '88', numberB: '99/11+100', answer: -1),
  QuestionCalculesDBModel(
      level: 3, numberA: '2*9', numberB: '20/5', answer: -1),
  QuestionCalculesDBModel(
      level: 3, numberA: '20*5-1', numberB: '19+21', answer: -1),
  QuestionCalculesDBModel(
      level: 3, numberA: '4*4', numberB: '1+16-1', answer: 0),
  QuestionCalculesDBModel(
      level: 3, numberA: '50*20', numberB: '2*10*0*54', answer: 1),
  QuestionCalculesDBModel(
      level: 3, numberA: '77/7', numberB: '7/77', answer: 1),
  QuestionCalculesDBModel(
      level: 3, numberA: '9*9', numberB: '200-33', answer: -1),
  QuestionCalculesDBModel(
      level: 3, numberA: '500+400', numberB: '655+345', answer: 0),
  QuestionCalculesDBModel(level: 3, numberA: '99+1', numberB: '020', answer: 1),
  QuestionCalculesDBModel(level: 3, numberA: '69', numberB: '96', answer: -1),
  QuestionCalculesDBModel(
      level: 3, numberA: '8*8', numberB: '88-24', answer: 0),
  QuestionCalculesDBModel(
      level: 3, numberA: '222', numberB: '11*12', answer: 1),
  QuestionCalculesDBModel(
      level: 3, numberA: '2*12', numberB: '2021-550', answer: -1),
  QuestionCalculesDBModel(
      level: 3, numberA: '5-1*2+6', numberB: '2+3*3', answer: 0),
  QuestionCalculesDBModel(
      level: 3, numberA: '4*3*2', numberB: '2*3*4', answer: 0),
  QuestionCalculesDBModel(
      level: 3, numberA: '13+8', numberB: '5*5-4', answer: 0),
  QuestionCalculesDBModel(level: 3, numberA: '4', numberB: '0*9*8', answer: 1),
  QuestionCalculesDBModel(
      level: 3, numberA: '2*13', numberB: '12*3', answer: -1),
  QuestionCalculesDBModel(level: 3, numberA: '3*4', numberB: '6*2', answer: 0),
  QuestionCalculesDBModel(
      level: 3, numberA: '34-11', numberB: '15+6', answer: 1),
  QuestionCalculesDBModel(
      level: 3, numberA: '2*9', numberB: '20/5', answer: -1),
  QuestionCalculesDBModel(
      level: 3, numberA: '0+5*9', numberB: '0*5+9', answer: 1),
  QuestionCalculesDBModel(
      level: 3, numberA: '1/1/1', numberB: '2/1/1', answer: -1),
  QuestionCalculesDBModel(level: 3, numberA: '3/3*3', numberB: '3', answer: 0),
  QuestionCalculesDBModel(
      level: 3, numberA: '22', numberB: '(5+6)*2', answer: 0),
  QuestionCalculesDBModel(
      level: 3, numberA: '(9-5)-2', numberB: '9-(5-2)', answer: -1),
];
final List<QuestionGeometryDBModel> defaultGeometry = [
  QuestionGeometryDBModel(
      level: 1,
      type: 1,
      usesInput: false,
      questionText: 'Ceci est un?',
      answers: 'Carée,Triangle,Réctangle,Cercle',
      correctIndex: 3,
      imagePath: 'assets/geometric shapes/2D shapes non filled/cercle.svg'),
  QuestionGeometryDBModel(
      level: 1,
      type: 1,
      usesInput: false,
      questionText: 'Ceci est un?',
      answers: 'Triangle,Rectangle,Héxagone,Carée',
      correctIndex: 0,
      imagePath: 'assets/geometric shapes/2D shapes non filled/triangle.svg'),
  QuestionGeometryDBModel(
      level: 1,
      type: 2,
      usesInput: false,
      questionText: 'Ou est le carée?',
      answers: 'cercle,rectangle,caree,pentagone',
      correctIndex: 2,
      imagePath: ''),
  QuestionGeometryDBModel(
      level: 1,
      type: 2,
      usesInput: false,
      questionText: 'Ou est le réctangle',
      answers: 'trapeze,rectangle,ellipse,triangle equilaterale',
      correctIndex: 1,
      imagePath: ''),
  QuestionGeometryDBModel(
      level: 1,
      type: 1,
      usesInput: false,
      questionText: 'Ceci est un?',
      answers: 'Réctangle,Carée,Cercle,Héxagone',
      correctIndex: 3,
      imagePath: 'assets/geometric shapes/2D shapes non filled/hexagone.svg'),
  QuestionGeometryDBModel(
      level: 1,
      type: 2,
      usesInput: false,
      questionText: "Ou est l'étoile?",
      answers: 'pentagone,triangle rectangle,etoile,ellipse',
      correctIndex: 2,
      imagePath: ''),
  QuestionGeometryDBModel(
      level: 1,
      type: 1,
      usesInput: false,
      questionText: 'Ceci est un?',
      answers: 'trapeze,ellipse,hexagone,caree',
      correctIndex: 0,
      imagePath: 'assets/geometric shapes/2D shapes non filled/trapeze.svg'),
  QuestionGeometryDBModel(
      level: 1,
      type: 2,
      usesInput: false,
      questionText: 'Ou est le pentagone?',
      answers: 'ellipse,trapeze,losange,pentagone',
      correctIndex: 3,
      imagePath: ''),
  QuestionGeometryDBModel(
      level: 1,
      type: 1,
      usesInput: false,
      questionText: 'Ceci est un?',
      answers: 'Trapèze,Réctangle,Parallelogramme,Carée',
      correctIndex: 1,
      imagePath: 'assets/geometric shapes/2D shapes non filled/rectangle.svg'),
  QuestionGeometryDBModel(
      level: 1,
      type: 2,
      usesInput: false,
      questionText: 'Ou est le parallelogramme?',
      answers: 'parallelogramme,cercle,etoile,triangle isocele',
      correctIndex: 0,
      imagePath: ''),
  QuestionGeometryDBModel(
      level: 1,
      type: 3,
      usesInput: true,
      questionText: 'Ceci est un?',
      answers: 'caree,carée,Un caree,Un carée',
      correctIndex: -1,
      imagePath: 'assets/geometric shapes/2D shapes non filled/caree.svg'),
  QuestionGeometryDBModel(
      level: 1,
      type: 1,
      usesInput: false,
      questionText: 'Ceci est un?',
      answers: 'Pentagone,Carée,Héxagone,Ellipse',
      correctIndex: 0,
      imagePath: 'assets/geometric shapes/2D shapes non filled/pentagone.svg'),
  QuestionGeometryDBModel(
      level: 2,
      type: 2,
      usesInput: false,
      questionText: 'Ou est le triangle isocele?',
      answers:
          'triangle,triangle rectangle,triangle isocele,triangle equilaterale',
      correctIndex: 2,
      imagePath: ''),
  QuestionGeometryDBModel(
      level: 2,
      type: 3,
      usesInput: true,
      questionText: 'Ceci est un?',
      answers: 'rectangle,réctangle,un rectangle,un réctangle',
      correctIndex: -1,
      imagePath: 'assets/geometric shapes/2D shapes non filled/rectangle.svg'),
  QuestionGeometryDBModel(
      level: 2,
      type: 3,
      usesInput: true,
      questionText: 'Ceci est un?',
      answers: 'cercle,un cercle',
      correctIndex: -1,
      imagePath: 'assets/geometric shapes/2D shapes non filled/cercle.svg'),
  QuestionGeometryDBModel(
      level: 2,
      type: 2,
      usesInput: false,
      questionText: 'Ou est le triangle equilaterale?',
      answers:
          'triangle equilaterale,triangle rectangle,rectangle,triangle isocele',
      correctIndex: 0,
      imagePath: ''),
  QuestionGeometryDBModel(
      level: 2,
      type: 1,
      usesInput: false,
      questionText: 'Ceci est un?',
      answers: 'Trapèze,Cercle,Losange,Etoile',
      correctIndex: 2,
      imagePath: 'assets/geometric shapes/2D shapes non filled/losange.svg'),
  QuestionGeometryDBModel(
      level: 2,
      type: 3,
      usesInput: true,
      questionText: 'Ceci est un?',
      answers: 'trapeze,un trapeze,trapèze,un trapèze',
      correctIndex: -1,
      imagePath: 'assets/geometric shapes/2D shapes non filled/trapeze.svg'),
  QuestionGeometryDBModel(
      level: 2,
      type: 3,
      usesInput: true,
      questionText: 'Ce triangle est?',
      answers: 'triangle equilaterale,equilaterale,un triangle equilaterale',
      correctIndex: -1,
      imagePath:
          'assets/geometric shapes/2D shapes non filled/triangle equilaterale.svg'),
  QuestionGeometryDBModel(
      level: 2,
      type: 3,
      usesInput: true,
      questionText: 'Ceci est un?',
      answers: 'ellipse,un ellipse,éllipse,un éllipse ',
      correctIndex: -1,
      imagePath: 'assets/geometric shapes/2D shapes non filled/ellipse.svg'),
  QuestionGeometryDBModel(
      level: 2,
      type: 1,
      usesInput: false,
      questionText: 'Ceci est un?',
      answers: 'Trapèze,Cercle,Losange,Etoile',
      correctIndex: 2,
      imagePath: 'assets/geometric shapes/2D shapes non filled/losange.svg'),
  QuestionGeometryDBModel(
      level: 2,
      type: 2,
      usesInput: false,
      questionText: 'Ou est le triangle réctangle?',
      answers: 'triangle,triangle rectangle,rectangle,triangle isocele',
      correctIndex: 1,
      imagePath: ''),
  QuestionGeometryDBModel(
      level: 2,
      type: 1,
      usesInput: false,
      questionText: 'Ceci est un?',
      answers: 'Cercle,Carée,Trapèze,Ellipse',
      correctIndex: 1,
      imagePath: 'assets/geometric shapes/2D shapes non filled/caree.svg'),
  QuestionGeometryDBModel(
      level: 2,
      type: 3,
      usesInput: true,
      questionText: 'Ce triangle est?',
      answers: 'triangle isocele,isocele,un triangle isocele',
      correctIndex: -1,
      imagePath:
          'assets/geometric shapes/2D shapes non filled/triangle isocele.svg'),
  QuestionGeometryDBModel(
      level: 3,
      type: 1,
      usesInput: false,
      questionText: 'Le périmètre est?',
      answers: '18 cm,20 cm,25 cm,9 cm',
      correctIndex: 0,
      imagePath:
          'assets/geometric shapes/2D shapes for calculations/rectangle 6-3.svg'),
  QuestionGeometryDBModel(
      level: 3,
      type: 1,
      usesInput: false,
      questionText: 'Le périmètre est?',
      answers: '4 cm,8 cm,10 cm,20 cm',
      correctIndex: 1,
      imagePath:
          'assets/geometric shapes/2D shapes for calculations/caree 2.svg'),
  QuestionGeometryDBModel(
      level: 3,
      type: 1,
      usesInput: false,
      questionText: 'La surface est?',
      answers: '9 cm²,8 cm²,14 cm²,21 cm²',
      correctIndex: 2,
      imagePath:
          'assets/geometric shapes/2D shapes for calculations/parallelogramme 7-2-3.svg'),
  QuestionGeometryDBModel(
      level: 3,
      type: 1,
      usesInput: false,
      questionText: 'Le périmètre est?',
      answers: '10 cm,20 cm,13 cm,8 cm',
      correctIndex: 2,
      imagePath:
          'assets/geometric shapes/2D shapes for calculations/triangle 6-3-4.svg'),
  QuestionGeometryDBModel(
      level: 3,
      type: 1,
      usesInput: false,
      questionText: 'Le surface est?',
      answers: '6cm²,60mm²,16 cm²,5cm²',
      correctIndex: 0,
      imagePath:
          'assets/geometric shapes/2D shapes for calculations/triangle 5-4-3.svg'),
  QuestionGeometryDBModel(
      level: 3,
      type: 1,
      usesInput: false,
      questionText: 'La surface est?',
      answers: '21cm²,25cm²,5cm²,20cm²',
      correctIndex: 1,
      imagePath:
          'assets/geometric shapes/2D shapes for calculations/caree 5.svg'),
  QuestionGeometryDBModel(
      level: 3,
      type: 1,
      usesInput: false,
      questionText: 'Le périmètre est?',
      answers: '120 mm,10 cm,3 cm,7 mm',
      correctIndex: 0,
      imagePath:
          'assets/geometric shapes/2D shapes for calculations/hexagone 2.svg'),
  QuestionGeometryDBModel(
      level: 3,
      type: 1,
      usesInput: false,
      questionText: 'La surface est?',
      answers: '7cm²,4cm²,3cm²,2cm²',
      correctIndex: 2,
      imagePath:
          'assets/geometric shapes/2D shapes for calculations/trapeze 4-2-1.svg'),
  QuestionGeometryDBModel(
      level: 3,
      type: 1,
      usesInput: false,
      questionText: 'La surface est?',
      answers: '30cm²,20cm²,24cm²,10cm²',
      correctIndex: 3,
      imagePath:
          'assets/geometric shapes/2D shapes for calculations/triangle 6-5-4.svg'),
];
final List<QuestionAnimalsDBModel> defaultAnimals = [
  QuestionAnimalsDBModel(
      level: 1,
      type: 1,
      usesInput: false,
      questionText: 'Quel est cet animal?',
      answers: 'chat,renard,chacale,lynx',
      correctIndex: 0,
      imagePath: 'assets/animals/images/chat.jpg',
      audioPath: ''),
  QuestionAnimalsDBModel(
      level: 1,
      type: 1,
      usesInput: false,
      questionText: 'Quel est cet animal?',
      answers: 'coyote,renard,chien,hyène',
      correctIndex: 2,
      imagePath: 'assets/animals/images/chien.jpg',
      audioPath: ''),
  QuestionAnimalsDBModel(
      level: 1,
      type: 1,
      usesInput: false,
      questionText: 'Quel est cet animal?',
      answers: 'mouflon,chevre,serf,mouton',
      correctIndex: 3,
      imagePath: 'assets/animals/images/mouton.jpg',
      audioPath: ''),
  QuestionAnimalsDBModel(
      level: 1,
      type: 1,
      usesInput: false,
      questionText: 'Quel est cet animal?',
      answers: 'gazelle,cheval,zèbre,rhinocéros',
      correctIndex: 1,
      imagePath: 'assets/animals/images/cheval.jpg',
      audioPath: ''),
  QuestionAnimalsDBModel(
      level: 1,
      type: 1,
      usesInput: false,
      questionText: 'Quel est cet animal?',
      answers: 'oie,canard,poule,dinde',
      correctIndex: 2,
      imagePath: 'assets/animals/images/poule.jpg',
      audioPath: ''),
  QuestionAnimalsDBModel(
      level: 1,
      type: 1,
      usesInput: false,
      questionText: 'Quel est cet animal?',
      answers: 'pigeon,martinet,moineau,merle noir',
      correctIndex: 1,
      imagePath: 'assets/animals/images/martinet.jpg',
      audioPath: ''),



  QuestionAnimalsDBModel(
      level: 2,
      type: 1,
      usesInput: false,
      questionText: 'Quel est cet animal?',
      answers: 'pie,merle noir,perroquet,corbeau',
      correctIndex: 3,
      imagePath: 'assets/animals/images/corbeau.jpg',
      audioPath: ''),
  QuestionAnimalsDBModel(
      level: 2,
      type: 1,
      usesInput: false,
      questionText: 'Quel est cet animal?',
      answers: 'lion,léopard,tigre,chacal',
      correctIndex: 0,
      imagePath: 'assets/animals/images/lion.jpg',
      audioPath: ''),
  QuestionAnimalsDBModel(
      level: 2,
      type: 4,
      usesInput: false,
      questionText: 'Le tigre vit en..',
      answers: 'Afrique,Asie,Europe,Amérique',
      correctIndex: 1,
      imagePath: '',
      audioPath: ''),
  QuestionAnimalsDBModel(
      level: 2,
      type: 1,
      usesInput: false,
      questionText: 'Quel est cet animal?',
      answers: 'touterelle,pie,pigeon,pic',
      correctIndex: 2,
      imagePath: 'assets/animals/images/pigeon.jpg',
      audioPath: ''),
  QuestionAnimalsDBModel(
      level: 2,
      type: 4,
      usesInput: false,
      questionText: "L'hippopotame vit en..",
      answers: 'Amérique,Asie,Australie,Afrique',
      correctIndex: 3,
      imagePath: '',
      audioPath: ''),
  QuestionAnimalsDBModel(
      level: 2,
      type: 1,
      usesInput: false,
      questionText: "Quel est cet animal?",
      answers: 'hippopotame,elephant,mamouth,bouquetin',
      correctIndex: 2,
      imagePath: 'assets/animals/images/mamouth.jpg',
      audioPath: ''),
  QuestionAnimalsDBModel(
      level: 2,
      type: 4,
      usesInput: false,
      questionText: "Le martinet est un...",
      answers: 'herbivore,omnivore,carnivore,insectivore',
      correctIndex: 3,
      imagePath: '',
      audioPath: ''),


  QuestionAnimalsDBModel(
      level: 3,
      type: 4,
      usesInput: false,
      questionText: "Quel est l'animal le plus rapide en courant?",
      answers: 'gazelle,lion,guéppard,léopard',
      correctIndex: 2,
      imagePath: '',
      audioPath: ''),
  QuestionAnimalsDBModel(
      level: 3,
      type: 1,
      usesInput: false,
      questionText: "Quel est cet animal?",
      answers: 'émeu,autruche,kangourou,kiwi',
      correctIndex: 2,
      imagePath: 'assets/animals/images/kangaroo.jpg',
      audioPath: ''),
  QuestionAnimalsDBModel(
      level: 3,
      type: 4,
      usesInput: false,
      questionText: "Parmi ces animaux on ne peut plus trouver...",
      answers: 'elephant,vache,gazelle,mamouth',
      correctIndex: 3,
      imagePath: '',
      audioPath: ''),
  QuestionAnimalsDBModel(
      level: 3,
      type: 1,
      usesInput: false,
      questionText: "Quel est cet animal?",
      answers: 'poisson rouge,sardine,carp,merlin',
      correctIndex: 0,
      imagePath: 'assets/animals/images/poisson rouge.jpg',
      audioPath: ''),
  QuestionAnimalsDBModel(
      level: 3,
      type: 4,
      usesInput: false,
      questionText: "Le loup est un..?",
      answers: 'omnivore,herbivore,insectivore,carnivore',
      correctIndex: 3,
      imagePath: '',
      audioPath: ''),
  QuestionAnimalsDBModel(
      level: 3,
      type: 1,
      usesInput: false,
      questionText: "Quel est cet animal?",
      answers: 'mouton,vache,antelope,bison',
      correctIndex: 1,
      imagePath: 'assets/animals/images/vache.jpg',
      audioPath: ''),
  QuestionAnimalsDBModel(
      level: 3,
      type: 4,
      usesInput: false,
      questionText: "On peut pas trouver des martinets en ...",
      answers: 'afrique,asie,antarctique,amérique latine',
      correctIndex: 2,
      imagePath: '',
      audioPath: ''),
];

final List<StatisticsDBModel> defaultStatistic = [
  StatisticsDBModel(
    id: 1,
    year: 2020,
    month: 7,
    day: 5,
    calculs: 0,
    geometry: 0,
    animals: 0,
  ),
  StatisticsDBModel(
    id: 2,
    year: 2020,
    month: 7,
    day: 6,
    calculs: 1,
    geometry: 2,
    animals: 3,
  ),
  StatisticsDBModel(
    id: 3,
    year: 2020,
    month: 7,
    day: 7,
    calculs: 5,
    geometry: 6,
    animals: 7,
  ),
];
