import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:http/testing.dart';
import 'package:mockito/annotations.dart';
import 'package:vegan_cibum/data/models/recipe_model.dart';
import 'package:vegan_cibum/data/service/api_service.dart';

import 'mocks/mock_recipe_detail.dart';
import 'mocks/mock_recipe_list.dart';

@GenerateNiceMocks([MockSpec<http.Client>()])
void main() {
  group("Testando o service de api", () {
    test("deve retornar uma lista de receitas", () async {
      //simula a requisição
      final mockClient = MockClient((request) async {
        return Response(jsonListRecipe, 200);
      });
      //pega o cliente falso e passa para o service de http
      final repository = ApiServiceHttp(mockClient);

      //execulta a requisição
      final recipes = await repository.fetchRecipe(3);

      //verifica se o retorno é uma lista de recipe models
      expect(recipes, isA<List<RecipeModel>>());

      //verifica se não é vazio
      expect(recipes.isNotEmpty, true);
    });
    
    test("deve retornar informações da receita", ()async {
      final mockClient = MockClient((request) async {
        return Response(jsonDetailrecipe, 200);
      });

      final repository = ApiServiceHttp(mockClient);

      final detailRecipe = await repository.getDetailRecipe(1);

      //verifica se o nome é igual 
      expect(detailRecipe.title, 'Vegan Pancakes');
    });
  });
}
