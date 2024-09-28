import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart'; // Import the launcher package

class SchoolInfoPage extends StatefulWidget {
  const SchoolInfoPage({super.key});

  @override
  SchoolInfoPageState createState() => SchoolInfoPageState(); // Make the state class public
}

class SchoolInfoPageState extends State<SchoolInfoPage> { // Removed the underscore to make it public
  final Map<int, bool> _expandedSections = {
    0: true,
    1: false,
    2: false,
    3: false,
    4: false,
    5: false,
    6: false,
  };

  void _launchURL(Uri url) async {
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'School Information',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.teal[800],
        elevation: 5,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Card(
              color: Colors.lightBlue[50],
              elevation: 4,
              margin: const EdgeInsets.symmetric(vertical: 16.0),
              child: ListTile(
                leading: Icon(
                  Icons.school,
                  size: 40,
                  color: Colors.teal[800],
                ),
                title: const Text(
                  'Ysgol Sŵn Y Don',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                subtitle: const Text(
                  'Peulwys Estate, Llysfaen, Conwy LL29 9LL\nPhone: 01492 517472',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),

            Image.network(
              'https://ysgolswnydon.cymru/wp-content/uploads/2020/02/swn-y-don-front.jpg',
              height: 200,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 16),

            GestureDetector(
              onTap: () => _launchURL(Uri.parse('https://ysgolswnydon.cymru/')),
              child: Center(
                child: Text(
                  'Visit School Website',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.blue[700],
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),

            _buildExpansionPanelList(),
          ],
        ),
      ),
    );
  }

  Widget _buildExpansionPanelList() {
    return ExpansionPanelList(
      expansionCallback: (int index, bool isExpanded) {
        setState(() {
          _expandedSections[index] = !isExpanded;
        });
      },
      children: [
        _buildExpansionPanel(
          0,
          'Senior Leadership Team',
          _buildLeadershipInfo(),
        ),
        _buildExpansionPanel(
          1,
          'Playgroup Staff',
          _buildPlaygroupStaff(),
        ),
        _buildExpansionPanel(
          2,
          'Nursery & Reception',
          _buildNurseryAndReception(),
        ),
        _buildExpansionPanel(
          3,
          'Blwyddyn 1 a 2 (Yr 1 & 2)',
          _buildYears1to2(),
        ),
        _buildExpansionPanel(
          4,
          'Blwyddyn 2 a 3 (Yr 2 & 3)',
          _buildYears2to3(),
        ),
        _buildExpansionPanel(
          5,
          'Blwyddyn 4 a 5 (Yr 4 & 5)',
          _buildYears4to5(),
        ),
        _buildExpansionPanel(
          6,
          'Blwyddyn 5 a 6 (Yr 5 & 6)',
          _buildYears5to6(),
        ),
        _buildExpansionPanel(
          7,
          'Resource Base/Unedau Adnoddau',
          _buildResourceBase(),
        ),
      ],
    );
  }

  ExpansionPanel _buildExpansionPanel(int index, String title, Widget content) {
    return ExpansionPanel(
      headerBuilder: (context, isExpanded) {
        return ListTile(
          title: Text(
            title,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.teal,
            ),
          ),
        );
      },
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: content,
      ),
      isExpanded: _expandedSections[index] ?? false,
    );
  }

  // Senior Leadership Team
  Widget _buildLeadershipInfo() {
    return Card(
      color: Colors.lightGreen[50],
      elevation: 3,
      child: const ListTile(
        title: Text(
          'Pennaeth/Headteacher: Mrs S Fox\nAssistant Headteacher & ALNCO: Miss S Salisbury',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          'Phone: 01492 517472\nEmail: pennaeth@ysgolswnydon.cymru',
        ),
      ),
    );
  }

  Widget _buildPlaygroupStaff() {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Miss A Kemshell'),
        Text('Miss A Moore'),
        Text('Miss G Lewis'),
        Text('Mrs J Williams'),
      ],
    );
  }

  Widget _buildNurseryAndReception() {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Seren – Mr M Roberts'),
        Text('TA – Mrs L Davies'),
        Text('TA – Mrs L Roberts'),
      ],
    );
  }

  Widget _buildYears1to2() {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Pili Palas – Mrs R Littlewood'),
        Text('TA – Miss E Hughes'),
        Text('TA – Mr D Morris'),
      ],
    );
  }

  Widget _buildYears2to3() {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Derwen – Mrs G Brown'),
        Text('TA – Mrs E Beamson'),
      ],
    );
  }

  Widget _buildYears4to5() {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Awel – Miss E Salisbury'),
        Text('TA – Mrs L Richards'),
      ],
    );
  }

  Widget _buildYears5to6() {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Gorwel – Mrs N Edge'),
        Text('TA – Miss S Roberts'),
      ],
    );
  }

  Widget _buildResourceBase() {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Hafan – Miss S Williams'),
        Text('TA – Mrs K McQueen'),
        Text('TA – Mrs H Walker'),
        Text('Enfys – Mrs J Howells'),
        Text('TA – Mrs D Sheridan'),
        Text('TA – Miss R Williams'),
        Text('TA – Mrs J Dale'),
      ],
    );
  }
}
