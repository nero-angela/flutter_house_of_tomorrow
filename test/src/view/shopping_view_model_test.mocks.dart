// Mocks generated by Mockito 5.3.2 from annotations
// in house_of_tomorrow/test/src/view/shopping_view_model_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:dio/dio.dart' as _i2;
import 'package:house_of_tomorrow/src/model/product.dart' as _i5;
import 'package:house_of_tomorrow/src/repository/product_repository.dart'
    as _i3;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeDio_0 extends _i1.SmartFake implements _i2.Dio {
  _FakeDio_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [ProductRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockProductRepository extends _i1.Mock implements _i3.ProductRepository {
  @override
  _i2.Dio get dio => (super.noSuchMethod(
        Invocation.getter(#dio),
        returnValue: _FakeDio_0(
          this,
          Invocation.getter(#dio),
        ),
        returnValueForMissingStub: _FakeDio_0(
          this,
          Invocation.getter(#dio),
        ),
      ) as _i2.Dio);
  @override
  _i4.Future<List<_i5.Product>> searchProductList(String? keyword) =>
      (super.noSuchMethod(
        Invocation.method(
          #searchProductList,
          [keyword],
        ),
        returnValue: _i4.Future<List<_i5.Product>>.value(<_i5.Product>[]),
        returnValueForMissingStub:
            _i4.Future<List<_i5.Product>>.value(<_i5.Product>[]),
      ) as _i4.Future<List<_i5.Product>>);
}