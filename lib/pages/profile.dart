/*      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Text('signed in as : ${user.email!}')),
          MaterialButton(
            onPressed: () {
              FirebaseAuth.instance.signOut();
            },
            color: Colors.blueGrey,
            child: Text('sign out'),
          ),
          Expanded(
            child: FutureBuilder(
              future: getDocId(),
              builder: (context, snapshot) {
                return ListView.builder(
                    itemCount: docIDs.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: GetUserName(
                          documentId: docIDs[index],
                        ),
                      );
                    });
              },
            ),
          ),
        ],
      ),*/