import 'dart:math';

import'package:flutter/material.dart';



class GuessNumber extends StatefulWidget {
  const GuessNumber({super.key});

  @override
  State<GuessNumber> createState() => _GuessNumberState();
}

class _GuessNumberState extends State<GuessNumber> {
  bool isTextFieldEnabled = true;
   int randomNumber = 0;
   int score = 20;
   int highScore = 0;
   TextEditingController _textController = TextEditingController();
   String status = 'Start guessing...';
   String answer = '?';

   @override
   void initState() {
    // TODO: implement initState
    super.initState();
    generateRandomNumbers();
  }
  void generateRandomNumbers() {
    setState(() {
      randomNumber = Random().nextInt(20) + 1;
      print(randomNumber);
    });
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: ListView(
            children: [
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 18.0, left: 12,right: 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                           backgroundColor: Colors.white,
                           textStyle: const TextStyle(
                             fontSize: 16,
                             fontWeight: FontWeight.bold,
                             color: Colors.black
                           )
                          ),
                          onPressed: () {
                            setState(() {
                              if (highScore == score || score == 0) {
                                highScore = score;
                                status = 'Start Guessing';
                                score = 20;
                                _textController.text = '';
                                isTextFieldEnabled = !isTextFieldEnabled;
                                answer = '?';
                              }
                            });
                        },
                            child: const Text('Again!',
                            style: TextStyle(
                              color: Colors.black
                            ),),),

                        const Text('(Between 1 and 20)')
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 36.0,
                  ),
                  const Center(
                      child: Text('Guess My Number',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30.0
                      ),)),
                   const SizedBox( height: 37.0,),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      const Divider(
                        height: 6.0,
                        thickness: 5.0,
                        color: Colors.white,
                      ),

                      Container(
                        width: 100,
                        height: 50,
                        color: Colors.white,
                        child: Center(child: Text(answer,
                        style: TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.bold,
                          color: Colors.black
                        ),)),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width:100,
                            child: TextField(
                              textAlign: TextAlign.center,
                              enabled: isTextFieldEnabled,
                              controller: _textController,
                              decoration: const InputDecoration(
                                hintText: 'Enter your Number',
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.white,
                                        width: 5.0,
                                        style: BorderStyle.solid,
                                      ),
                                  ),
                                contentPadding: EdgeInsets.all(16.0)
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 16.0,
                          ),

                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                textStyle: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black
                                )

                            ),
                              onPressed: () {
                                String enteredText = _textController.text;
                                setState(() {
                                  if (randomNumber.toString() == enteredText) {
                                    highScore = score;
                                    status = '💯 Correct';
                                    answer = randomNumber.toString();
                                    isTextFieldEnabled = !isTextFieldEnabled;
                                    print('Entered text: $enteredText');
                                  } else if (randomNumber > int.parse(enteredText) && score >= 1) {
                                    score--;
                                    status = '📉 Too Low';

                                  } else if (randomNumber < int.parse(enteredText) && score >= 1) {
                                    score--;
                                    status = '📈 Too High';
                                  } else {
                                    print('sleep off');
                                  }
                                });
                              },
                              child: const Text('Check!',
                              style: TextStyle(
                                color: Colors.black
                              ),))
                        ],
                      ),
                       Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                           Text(status,
                          style: const TextStyle(
                            fontSize: 20
                          ),),
                          const SizedBox(height: 20.0,),
                          Text('💯 Score: $score',
                            style: const TextStyle(
                              fontSize: 20
                          ),),
                          const SizedBox(height: 8.0,),
                          Text('🥇 Highscore: $highScore',
                            style: const TextStyle(
                                fontSize: 20
                            ),)
                        ],
                      )
                    ],
                  )
                ],
              )

            ],
          ),
        ));
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

}
