import 'package:flutter/material.dart';
import 'package:pks_3/components/store_item.dart';
import 'package:pks_3/models/microphone.dart';
import 'package:pks_3/pages/add_microphone_page.dart';

class HomePage extends StatefulWidget {
    const HomePage({super.key});

    @override
    _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
    List<Microphone> entries = <Microphone>[
        Microphone(
            name: 'Neumann U 87 Ai',
            image: 'assets/images/neumann_u87.jpg',
            info: 'Один из самых известных студийных конденсаторных микрофонов...',
            price: 3500,
            frequencyResponse: '20 Гц - 20 кГц',
            polarPattern: 'Кардиоида, широкая кардиоида, октава',
            listen: 'https://www.thomann.de/gb/neumann_u_87_ai.htm',
        ),
        Microphone(
            name: 'Shure SM7B',
            image: 'assets/images/shure_sm7b.png',
            info: 'Динамический микрофон, популярный среди вокалистов и радиоведущих...',
            price: 399,
            frequencyResponse: '50 Гц - 20 кГц',
            polarPattern: 'Кардиоида',
            listen: 'https://www.shure.com/en-US/products/microphones/sm7b',
        ),
        Microphone(
            name: 'AKG C414 XLII',
            image: 'assets/images/akg_c414.png',
            info: 'Многорежимный конденсаторный микрофон с широким выбором настроек...',
            price: 1200,
            frequencyResponse: '20 Гц - 20 кГц',
            polarPattern: 'Кардиоида, октава, суперкардиоида, бикардиоида, круговая',
            listen: 'https://www.akg.com/pro/p/c414',
        ),
        Microphone(
            name: 'Sennheiser MD 421',
            image: 'assets/images/sennheiser_md421.jpg',
            info: 'Динамический микрофон с характерным тёплым звучанием...',
            price: 450,
            frequencyResponse: '30 Гц - 17 кГц',
            polarPattern: 'Кардиоида',
            listen: 'https://en-de.sennheiser.com/md-421-ii',
        ),
        Microphone(
            name: 'Rode NT1-A',
            image: 'assets/images/rode_nt1a.png',
            info: 'Конденсаторный микрофон с низким уровнем шума...',
            price: 250,
            frequencyResponse: '20 Гц - 20 кГц',
            polarPattern: 'Кардиоида',
            listen: 'https://www.rode.com/microphones/nt1-a',
        ),
        Microphone(
            name: 'Audio-Technica AT4050',
            image: 'assets/images/audio_technica_at4050.jpg',
            info: 'Многорежимный конденсаторный микрофон с высокой гибкостью...',
            price: 900,
            frequencyResponse: '20 Гц - 20 кГц',
            polarPattern: 'Кардиоида, октава, бикардиоида',
            listen: 'https://www.audio-technica.com/en-us/at4050',
        ),
        Microphone(
            name: 'Telefunken M80',
            image: 'assets/images/telefunken_m80.jpg',
            info: 'Динамический микрофон с высокой устойчивостью к внешним шумам...',
            price: 300,
            frequencyResponse: '50 Гц - 15 кГц',
            polarPattern: 'Кардиоида',
            listen: 'https://www.telefunken-elektroakustik.com/m80',
        ),
        Microphone(
            name: 'Blue Yeti',
            image: 'assets/images/blue_yeti.jpg',
            info: 'Конденсаторный микрофон с несколькими режимами записи...',
            price: 129,
            frequencyResponse: '20 Гц - 20 кГц',
            polarPattern: 'Кардиоида, бикардиоида, октава, круговая',
            listen: 'https://www.bluemic.com/en-us/products/yeti/',
        ),
        Microphone(
            name: 'Neumann TLM 102',
            image: 'assets/images/neumann_tlm102.jpg',
            info: 'Конденсаторный микрофон с низким уровнем шума и высокой чувствительностью...',
            price: 700,
            frequencyResponse: '20 Гц - 20 кГц',
            polarPattern: 'Кардиоида',
            listen: 'https://www.neumann.com/homestudio/en/tlm-102',
        ),
        Microphone(
            name: 'MXL 770',
            image: 'assets/images/mxl_770.jpg',
            info: 'Конденсаторный микрофон с высокой чувствительностью...',
            price: 150,
            frequencyResponse: '20 Гц - 20 кГц',
            polarPattern: 'Кардиоида',
            listen: 'https://www.mxlmics.com/microphones/770/',
        ),
    ];

    void navigateToAddMicrophonePage(BuildContext context) async {
        final Microphone? result = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddMicrophonePage()),
        );

        if (result != null) {
            setState(() {
                entries.add(result);
            });
        }
    }

    void removeMicrophone(int index) {
        showDialog(
            context: context,
            builder: (BuildContext context) {
                return AlertDialog(
                    backgroundColor: const Color.fromRGBO(102, 155, 188, 1),
                    title: const Text('Подтверждение удаления'),
                    content: const Text('Вы уверены, что хотите удалить этот микрофон?'),
                    actions: <Widget>[
                        TextButton(
                            child: const Text('Отмена', style: TextStyle(color: Colors.black)),
                            onPressed: () {
                                Navigator.of(context).pop();
                            },
                        ),
                        TextButton(
                            child: const Text('Удалить', style: TextStyle(color: Colors.black)),
                            onPressed: () {
                                setState(() {
                                    entries.removeAt(index);
                                });
                                Navigator.of(context).pop();
                            },
                        ),
                    ],
                );
            },
        );
    }

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: const Center(
                    child: Text(
                        'Microphone Store',
                        style: TextStyle(
                            color: Color.fromRGBO(102, 155, 188, 1),
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                        ),
                    ),
                ),
                backgroundColor: const Color.fromRGBO(57, 62, 65, 1),
            ),
            backgroundColor: const Color.fromRGBO(57, 62, 65, 1),
            body: entries.isEmpty
                ? const Center(
                child: Text(
                    "Нет добавленных микрофонов",
                    style: TextStyle(color: Color.fromRGBO(102, 155, 188, 1), fontSize: 18),
                ),
            )
                : ListView.builder(
                itemCount: entries.length,
                itemBuilder: (context, index) {
                    return StoreItem(
                        microphone: entries[index],
                        index: index,
                        removeMicrophone: removeMicrophone,
                    );
                },
            ),
            floatingActionButton: FloatingActionButton(
                backgroundColor: const Color.fromRGBO(42, 157, 143, 1),
                onPressed: () => navigateToAddMicrophonePage(context),
                child: const Icon(Icons.add),
                tooltip: "Добавить микрофон",
            ),
        );
    }
}