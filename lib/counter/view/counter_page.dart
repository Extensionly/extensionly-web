// Copyright (c) 2021, Very Good Ventures
// https://verygood.ventures
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:extensionly_web/counter/counter.dart';
import 'package:extensionly_web/events/view/events_page.dart';
import 'package:extensionly_web/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CounterCubit(),
      child: const CounterView(),
    );
  }
}

class CounterView extends StatelessWidget {
  const CounterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        title: Text(l10n.appBarTitle),
        actions: [
          MaterialButton(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: Text(
                l10n.events,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            onPressed: () {},
          ),
          MaterialButton(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: Text(
                l10n.signInButton.toUpperCase(),
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            onPressed: () {},
          ),
          const SizedBox(width: 20)
        ],
      ),
      body: Center(
        child: ListView(
          children: [
            Row(
              children: [
                Flexible(child: TappableTravelDestinationItem()),
                Flexible(child: TappableTravelDestinationItem()),
              ],
            ),
            Row(
              children: [
                Flexible(child: TappableTravelDestinationItem()),
                Flexible(child: TappableTravelDestinationItem()),
                Flexible(child: TappableTravelDestinationItem()),
                Flexible(child: TappableTravelDestinationItem()),
              ],
            ),
            TappableTravelDestinationItem(),
            TappableTravelDestinationItem(),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          // FloatingActionButton(
          //   onPressed: () => context.read<CounterCubit>().increment(),
          //   child: const Icon(Icons.add),
          // ),
          // const SizedBox(height: 8),
          // FloatingActionButton(
          //   onPressed: () => context.read<CounterCubit>().decrement(),
          //   child: const Icon(Icons.remove),
          // ),
        ],
      ),
    );
  }
}

class CounterText extends StatelessWidget {
  const CounterText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final count = context.select((CounterCubit cubit) => cubit.state);
    return Text('$count', style: theme.textTheme.headline1);
  }
}
