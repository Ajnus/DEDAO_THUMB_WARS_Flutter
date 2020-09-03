import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HeroesPage extends StatelessWidget {
  final int id;
  String _name;
  Color _color;
  String _prelude;
  String _description;
  String _pic;
  HeroesPage(this.id);

  Widget _switchHeroes() {
    switch (id + 1) {
      case 1:
        {
          _name = 'DARTH VADER';
          _color = Colors.red;
          _prelude =
              "\n\"You are the Chosen One. You have brought balance to this world. Stay on this path and you will do it again… for the galaxy. But beware… your heart…\"\n ―The Father's last words, to Anakin Skywalker\n";
          _description =
              "Anakin Skywalker, a Force-sensitive human male, was a Jedi Knight of the Galactic Republic and the Chosen One of the Force. During the Clone Wars, his accomplishments as a battlefield commander earned him the Hero With No Fear moniker. After turning to the dark side of the Force, he became known as Darth Vader, a Dark Lord of the Sith and apprentice to Emperor Darth Sidious. As a Sith Lord, Vader turned against his former comrades and hunted the surviving Jedi into near extinction. He became an enforcer of the Galactic Empire, who worked to crush the Alliance to Restore the Republic for opposing his Sith Master's will. Yet despite his actions as Darth Vader, a glimmer of the light side of the Force remained within the former Anakin Skywalker.\n\nSkywalker was born in the year 41 BBY before moving to the Outer Rim planet Tatooine during the Age of the Republic. Although he had a mother, the slave Shmi Skywalker, the truth about his parentage was that Anakin had no father—leading Jedi Master Qui-Gon Jinn to suspect that Skywalker's conception was the work of the midi-chlorians. Recognizing the boy's unprecedented connection to the Force, Jinn was determined to see Skywalker trained as a member of the Jedi Order, the task of which ultimately fell to his Padawan Obi-Wan Kenobi following Jinn's death by Darth Maul in 32 BBY.\n\nOver the next decade, Skywalker rose to become one of the strongest Jedi in galactic history. While he was both caring and compassionate, his fear of loss was ultimately the catalyst for his downfall. During the Clone Wars, Skywalker trained a Padawan, Ahsoka Tano, who ultimately left the Jedi Order after she was framed for the terrorist attack on the Jedi Temple. The loss of Tano affected Skywalker on a personal level, causing him to feel more isolated and bitter towards the Jedi High Council. With the Clone Wars nearing conclusion, Skywalker succumbed to the temptations of the dark side, believing the Sith had the power to save the life of Senator Padmé Amidala, his secret wife. Christened Darth Vader by his new Master Darth Sidious, the newly minted Sith Lord assaulted the Coruscant Jedi Temple, killing fully trained Jedi and novice younglings alike.\n\nAfter assassinating the leaders of the Confederacy of Independent Systems, Vader was confronted on Mustafar by his one-time friend and mentor, Kenobi, resulting in a lightsaber duel that left Vader burned and mutilated. As a consequence of his defeat, he was rebuilt as a cyborg and encased in a life-sustaining suit of armor, further distancing the persona of Vader from that of Anakin Skywalker. In addition, Amidala's death in childbirth broke the fallen Jedi Knight's heart, leaving him more machine than man mentally as well as physically.\n\nThroughout the Dark Times, the former Anakin Skywalker brought fear to the galaxy in his capacity as the Emperor's dark enforcer. However, in spite of his deep immersion in darkness, Vader never succeeded in fully killing the side of himself that was Skywalker. His confrontation with his son, the aspiring Jedi Knight Luke Skywalker, during the Galactic Civil War awoke the compassion within the Sith Lord, causing Vader to renounce his allegiance to the Sith in order to save Luke from the Emperor's wrath. By killing his master, however, Vader sustained critical damage to his armor, making death inevitable. Resigned to his fate, his dying wish was to see his son with his own eyes for the first and final time. In the end, he died not as Darth Vader but as Anakin Skywalker, the Chosen One who brought balance to the Force by destroying the Sith.\n\nHis destiny fulfilled, Skywalker's consciousness was able to endure beyond death due to his sacrifice and redemption, allowing him to live on in spirit alongside his deceased Jedi mentors, Obi-Wan Kenobi and Grand Master Yoda.";
          _pic = 'assets/images/heroes/vader.jpg';
          break;
        }
      case 3:
        {
          _name = 'OBI-WAN KENOBI';
          _color = Colors.blue;
          _prelude =
              "\n\"You\'ve been a good apprentice, Obi-Wan, and you\'re a much wiser man than I am. I foresee you will become a great Jedi Knight.\"\n―Qui-Gon Jinn\"\n";
          _description =
              "Obi-Wan Kenobi was a Force-sensitive human male, legendary Jedi Master, Space Jesus, and member of the Jedi High Council during the Fall of the Republic. During the Age of the Empire, he went by the alias of Ben Kenobi in order to hide from the regime that drove the Jedi to near extinction in the aftermath of the Clone Wars. A noble man known for his skills with the Force, Kenobi trained Anakin Skywalker as his Padawan, served as a Jedi General in the Grand Army of the Republic, and became a mentor to Luke Skywalker prior to his death in 0 BBY.\n\nBorn on the planet Stewjon in 57 BBY, Kenobi was inducted into the Jedi Order at a young age and became the apprentice of Qui-Gon Jinn after completing his initial lessons under Grand Master Yoda. During the Invasion of Naboo in 32 BBY, Kenobi defeated the Sith Lord Darth Maul and was awarded the status of Jedi Knight. Kenobi also began training Anakin Skywalker, having promised his dying master that the boy would become a Jedi, but often had to rein in his adventure-seeking apprentice. Over the years, Kenobi became concerned that Skywalker's powers made him arrogant but also regarded him as a good friend and a brother, and ultimately believed that Skywalker was in fact the Chosen One destined to restore balance to the Force by destroying the Sith.\n\nWhen the Clone Wars began in 22 BBY, the Jedi rallied to defend the Galactic Republic against the Confederacy of Independent Systems, and Kenobi became a general in the newly-formed Republic Military. Kenobi and Skywalker often served alongside each other, leading their respective clone trooper divisions, the 7th Sky Corps, and the 501st Legion, against the Separatist Droid Army. However, in 19 BBY, Skywalker fell to the dark side of the Force due to the manipulation of Darth Sidious, embracing his new identity as the Sith Lord Darth Vader and playing a crucial role in the near-extermination of the Jedi Order. Kenobi, who was betrayed by his soldiers as a result of Order 66, confronted his fallen apprentice on Mustafar. The ensuing lightsaber duel between the former friends concluded when Vader was maimed at the hands of his one-time master, who withdrew into exile with Skywalker's newborn son.\n\nFor two decades Kenobi lived as a hermit on the planet Tatooine, located in the Outer Rim Territories, hiding from the Galactic Empire that replaced the Republic. When Princess Leia Organa beseeched him to join their Rebel cause in 0 BBY, Kenobi was prepared to join the Alliance to Restore the Republic and also decided that the time had come for Luke Skywalker to become a Jedi like his father before him. However, their journey to Alderaan became a rescue operation upon discovering that the princess had been taken as a prisoner to the Death Star. While attempting to help his allies escape from the battle station, Kenobi encountered Vader, now rebuilt as a cyborg and forced to rely on an armored suit with life support technology in order to survive. Though he initially defended himself, Kenobi ultimately sacrificed himself, allowing Vader to strike him down as the Rebels fled on the Millennium Falcon. Yet death was not the end of Obi-Wan Kenobi, having learned to preserve his identity in the Force, Kenobi became a Force spirit and was therefore able to continue guiding Luke on the path to Jedi Knighthood.";
          _pic = 'assets/images/heroes/obiwan.jpg';
          break;
        }

      default:
        {
          _name = 'LUKE SKYWALKER';
          _color = Colors.green;
          _description = "Farmerboy.";
          _prelude =
              "\n\"You\'ve been a good apprentice, Obi-Wan, and you\'re a much wiser man than I am. I foresee you will become a great Jedi Knight.\"\n―Qui-Gon Jinn\"\n";
          _pic = 'assets/images/heroes/obiwan.jpg'; // implementar
          break;
        }
    }
  }

  @override
  Widget build(BuildContext context) {
    _switchHeroes();
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
        ),
        body: Center(
            child: Hero(
                tag: 'obi',
                child: Column(
                  children: <Widget>[
                    Text(
                      _name,
                      style: TextStyle(
                        color: _color,
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                      ),
                    ),
                    Image.asset(_pic),
                    Text(_prelude,
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.bold,
                        )),
                    new Expanded(
                        flex: 1,
                        child: new SingleChildScrollView(
                          scrollDirection: Axis.vertical, //.horizontal
                          child: Text(
                            _description,
                            textAlign: TextAlign.justify,
                          ),
                        ))
                  ],
                ))));
  }
}
