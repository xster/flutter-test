import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import 'api.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      title: 'Repo Analysis',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  ValueNotifier<Client> graphQlClient;

  @override
  void initState() {
    super.initState();
    graphQlClient = ValueNotifier(
      Client(
        endPoint: 'https://api.github.com/graphql',
        cache: InMemoryCache(),
        apiToken: API_KEY,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: const Text('Repo Analysis'),
      ),
      child: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: GraphqlProvider(
          client: graphQlClient,
          child: Content(),
        ),
      ),
    );
  }
}

class Content extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Query(
'''query {
  search(first: 100, query: "repo:flutter/flutter type:pr state:open label:\"f: cupertino\"", type:ISSUE) {
		nodes {
			... on PullRequest {
				number
				updatedAt
			}
		}
	}
}'''.replaceAll('\n', ' '),
      builder: ({bool loading, var data, Exception error}) {
        if (error != null)
          return Text(error.toString());

        if (loading)
          return Text('loading...');

        List<Map<String, dynamic>> prs = data['data']['search']['nodes'];
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: prs.map((Map pr) => Text('PR ${pr["number"]}')).toList(),
        );
      },
    );
  }
}