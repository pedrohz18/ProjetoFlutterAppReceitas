import 'package:flutter/material.dart';

class TelaPesquisa extends StatefulWidget {
  const TelaPesquisa({super.key});

  @override
  State<TelaPesquisa> createState() => _TelaPesquisaState();
}

class _TelaPesquisaState extends State<TelaPesquisa> {
  // Controlador para ler o que foi digitado no campo de texto
  final TextEditingController _pesquisaController = TextEditingController();

  // Variáveis para controlar a tela
  String termoValido = '';
  bool mostrarResultados = false;
  String? mensagemErro; // Se for nulo, não tem erro

  // Função que executa quando clicamos em "Pesquisar"
  void _realizarPesquisa() {
    // .trim() remove os espaços em branco no início e no final do texto
    String textoDigitado = _pesquisaController.text.trim();

    setState(() {
      if (textoDigitado.isEmpty) {
        // Recusa consulta vazia ou só com espaços e diz como corrigir
        mensagemErro = 'Campo vazio. Digite o nome de uma receita (ex: Bolo) para buscar.';
        mostrarResultados = false;
      } else {
        // Pesquisa válida
        mensagemErro = null;
        termoValido = textoDigitado;
        mostrarResultados = true;
      }
    });
  }

  // Função para o botão "Limpar pesquisa"
  void _limparPesquisa() {
    setState(() {
      _pesquisaController.clear();
      mensagemErro = null;
      mostrarResultados = false;
      termoValido = '';
    });
  }

  @override
  void dispose() {
    _pesquisaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F6EF),
      // CABEÇALHO
      appBar: AppBar(
        backgroundColor: const Color(0xFFF7F6EF),
        elevation: 0,
        scrolledUnderElevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.red),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Pesquisar receitas',
          style: TextStyle(color: Colors.red, fontWeight: FontWeight.w900, fontSize: 22),
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1),
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 24),
            color: Colors.grey.withOpacity(0.2),
            height: 1,
          ),
        ),
      ),

      // CORPO DA TELA
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              const Text(
                'Nome da receita',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.red),
              ),
              const SizedBox(height: 8),

              // CAMPO DE PESQUISA ROTULADO
              TextField(
                controller: _pesquisaController,
                decoration: InputDecoration(
                  hintText: 'Ex: Miojo',
                  errorText: mensagemErro, // Mostra o erro se houver
                  prefixIcon: const Icon(Icons.search, color: Colors.grey),
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: const EdgeInsets.symmetric(vertical: 16),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
                // Permite pesquisar apertando "Enter" no teclado do celular
                onSubmitted: (_) => _realizarPesquisa(),
              ),
              const SizedBox(height: 16),

              // AÇÃO EXPLÍCITA: BOTÃO PESQUISAR
              ElevatedButton(
                onPressed: _realizarPesquisa,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white,
                  minimumSize: const Size(double.infinity, 54),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  elevation: 0,
                ),
                child: const Text('Pesquisar', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              ),

              const SizedBox(height: 32),

              // ÁREA DE RESULTADOS (Só aparece se mostrarResultados for true)
              if (mostrarResultados) ...[
                // Mostra o termo válido recebido
                Text(
                  'Resultados para "$termoValido"',
                  style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w900, color: Colors.red),
                ),
                const SizedBox(height: 4),
                const Text(
                  'Toque na receita para ver o preparo.',
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
                const SizedBox(height: 16),

                // Resultados Provisórios (MOCK)
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(color: Colors.black.withOpacity(0.03), blurRadius: 10, offset: const Offset(0, 4))
                    ],
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 90, height: 90,
                        decoration: BoxDecoration(
                          color: const Color(0xFFEBE6D9),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: const Center(child: Icon(Icons.local_drink_outlined, color: Color(0xFFD67B44), size: 48)),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Miojo',
                              style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: Colors.red, height: 1.2),
                            ),
                            const SizedBox(height: 10),
                            const Text('3 min  •  Fácil', style: TextStyle(fontSize: 13, color: Colors.red)),
                            const SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text('5 / 5', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.red)),
                                Icon(Icons.favorite_border, color: Colors.grey, size: 22),
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 24),

                // AÇÃO PARA LIMPAR E PERMITIR NOVA CONSULTA
                OutlinedButton(
                  onPressed: _limparPesquisa,
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.red,
                    side: const BorderSide(color: Colors.red, width: 1.5),
                    minimumSize: const Size(double.infinity, 54),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                  child: const Text('Limpar pesquisa', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                ),
              ]
            ],
          ),
        ),
      ),
    );
  }
}