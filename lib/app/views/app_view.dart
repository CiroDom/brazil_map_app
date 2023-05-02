import 'package:cep_view/app/app_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppView extends StatelessWidget {
  const AppView({super.key});

  @override
  Widget build(BuildContext context) {
    final appVM = Provider.of<AppVM>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('CEP'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: const InputDecoration(labelText: 'Digite seu CEP'),
                    maxLength: 8,
                    keyboardType: TextInputType.number,
                    onChanged: appVM.setCep,
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                ElevatedButton(
                  child: const Text('Ver mapa'),
                  onPressed: appVM.loadMapFromCep,
                ),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            AnimatedBuilder(
              animation: appVM,
              builder: (context, _) {
                if (appVM.imageUrl.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                }
                else if (appVM.imageUrl.connectionState == ConnectionState.none) {
                  return const Center(
                    child: Text('Não há mapa para mostrar'),
                  );
                }
                return Image.network(appVM.imageUrl.data!.toString());
              },
            )
          ],
        ),
      ),
    );
  }
}
