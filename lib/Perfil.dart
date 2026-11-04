import 'package:flutter/material.dart';
import 'package:projetoflutterapp/TelaPesquisa.dart';

class Perfil extends StatelessWidget {
  const Perfil({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 1. CABEÇALHO (AppBar)
        appBar: AppBar(
          backgroundColor: const Color(0xFFF7F6EF),
          elevation: 0,
          scrolledUnderElevation: 0, // Evita mudança de cor ao fazer scroll
          title: Text(
            'Eat Everything',
            style: TextStyle(
              color: Colors.red,
              fontWeight: FontWeight.w900,
              fontSize: 26,
            ),
          ),
          // Linha fina de separação abaixo do título
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(1),
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 24),
              color: Colors.grey.withOpacity(0.2),
              height: 1,
            ),
          ),
        ),

        // 2. RODAPÉ (NavigationBar do Material 3)
        bottomNavigationBar: NavigationBar(
          backgroundColor: Colors.white,
          indicatorColor: const Color(0xFFE2E9DB),
          selectedIndex: 0,
          destinations: [
            NavigationDestination(
              icon: Icon(Icons.search, color: Colors.red),
              label: 'Busca',
            ),
            NavigationDestination(
              icon: Icon(Icons.restaurant_menu, color: Colors.red),
              label: 'Salvo',
            ),
            NavigationDestination(
              icon: Icon(Icons.person, color: Colors.red),
              label: 'Perfil',
            ),
          ],
        ),

        // 3. CORPO DO ECRÃ
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                // --- SECÇÃO: PESQUISA ---
                Text(
                  'Home Receitas',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w900,
                    color: Colors.red,
                  ),
                ),
                const SizedBox(height: 24),

                // Botão Principal
                ElevatedButton(
                  onPressed: () {Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const TelaPesquisa()));},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.white,
                    minimumSize: const Size(double.infinity, 54), // Largura total
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 0,
                  ),
                  child: const Text(
                    'Buscar receitas',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),

                const SizedBox(height: 48),

                // --- SECÇÃO: RECEITAS DISPONÍVEIS ---
                Text(
                  'Receitas Disponíveis',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w900,
                    color: Colors.red,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  'Escolha uma Receita para ver o Modo de Preparo.',
                  style: TextStyle(fontSize: 15, color: Colors.grey),
                ),
                const SizedBox(height: 20),

                // Cartão da Receita
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.03), // Sombra muito suave
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      )
                    ],
                  ),
                  child: Row(
                    children: [
                      // Imagem da Receita (Simulada com ícone)
                      Container(
                        width: 90,
                        height: 90,
                        decoration: BoxDecoration(
                          color: const Color(0xFFEBE6D9), // Fundo bege da imagem
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: const Center(
                          child: Icon(Icons.local_pizza, color: Color(0xFFD67B44), size: 48),
                        ),
                      ),
                      const SizedBox(width: 16),

                      // Informações à direita
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Margarita Pizza',
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                                color: Colors.red,
                                height: 1.2,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              '35 min  •  Fácil',
                              style: TextStyle(fontSize: 13, color: Colors.red),
                            ),
                            const SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '4,6 / 5',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.red,
                                  ),
                                ),
                                Icon(Icons.bookmark_add_outlined, color: Colors.grey, size: 30),
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),const SizedBox(height: 16),
                //Item dois Menu
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.03), // Sombra muito suave
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      )
                    ],
                  ),
                  child: Row(
                    children: [
                      // Imagem da Receita (Simulada com ícone)
                      Container(
                        width: 90,
                        height: 90,
                        decoration: BoxDecoration(
                          color: const Color(0xFFEBE6D9), // Fundo bege da imagem
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: const Center(
                          child: Icon(Icons.cake, color: Color(0xFFD67B44), size: 48),
                        ),
                      ),
                      const SizedBox(width: 16),

                      // Informações à direita
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Bolo de Chocolate',
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                                color: Colors.red,
                                height: 1.2,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              '40 min  •  Médio',
                              style: TextStyle(fontSize: 13, color: Colors.red),
                            ),
                            const SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '5 / 5',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.red,
                                  ),
                                ),
                                Icon(Icons.bookmark_add_outlined, color: Colors.grey, size: 30),
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),const SizedBox(height: 16),
                //Item Três
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.03), // Sombra muito suave
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      )
                    ],
                  ),
                  child: Row(
                    children: [
                      // Imagem da Receita (Simulada com ícone)
                      Container(
                        width: 90,
                        height: 90,
                        decoration: BoxDecoration(
                          color: const Color(0xFFEBE6D9), // Fundo bege da imagem
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: const Center(
                          child: Icon(Icons.local_pizza, color: Color(0xFFD67B44), size: 48),
                        ),
                      ),
                      const SizedBox(width: 16),

                      // Informações à direita
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Pizza Quatro Queijos',
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                                color: Colors.red,
                                height: 1.2,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              '25 min  •  Fácil',
                              style: TextStyle(fontSize: 13, color: Colors.red),
                            ),
                            const SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '5 / 5',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.red,
                                  ),
                                ),
                                Icon(Icons.bookmark_add_outlined, color: Colors.grey, size: 30),
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        )
    );
  }
}
