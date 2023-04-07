// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hesap.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

extension GetHesapCollection on Isar {
  IsarCollection<Hesap> get hesaps => this.collection();
}

const HesapSchema = CollectionSchema(
  name: r'Hesap',
  id: 4952774218421634050,
  properties: {
    r'bankName': PropertySchema(
      id: 0,
      name: r'bankName',
      type: IsarType.string,
    ),
    r'ibanNumber': PropertySchema(
      id: 1,
      name: r'ibanNumber',
      type: IsarType.string,
    ),
    r'select': PropertySchema(
      id: 2,
      name: r'select',
      type: IsarType.bool,
    )
  },
  estimateSize: _hesapEstimateSize,
  serialize: _hesapSerialize,
  deserialize: _hesapDeserialize,
  deserializeProp: _hesapDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _hesapGetId,
  getLinks: _hesapGetLinks,
  attach: _hesapAttach,
  version: '3.0.5',
);

int _hesapEstimateSize(
  Hesap object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.bankName;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.ibanNumber;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _hesapSerialize(
  Hesap object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.bankName);
  writer.writeString(offsets[1], object.ibanNumber);
  writer.writeBool(offsets[2], object.select);
}

Hesap _hesapDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Hesap();
  object.bankName = reader.readStringOrNull(offsets[0]);
  object.ibanNumber = reader.readStringOrNull(offsets[1]);
  object.id = id;
  object.select = reader.readBool(offsets[2]);
  return object;
}

P _hesapDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readBool(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _hesapGetId(Hesap object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _hesapGetLinks(Hesap object) {
  return [];
}

void _hesapAttach(IsarCollection<dynamic> col, Id id, Hesap object) {
  object.id = id;
}

extension HesapQueryWhereSort on QueryBuilder<Hesap, Hesap, QWhere> {
  QueryBuilder<Hesap, Hesap, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension HesapQueryWhere on QueryBuilder<Hesap, Hesap, QWhereClause> {
  QueryBuilder<Hesap, Hesap, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Hesap, Hesap, QAfterWhereClause> idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<Hesap, Hesap, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Hesap, Hesap, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Hesap, Hesap, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension HesapQueryFilter on QueryBuilder<Hesap, Hesap, QFilterCondition> {
  QueryBuilder<Hesap, Hesap, QAfterFilterCondition> bankNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'bankName',
      ));
    });
  }

  QueryBuilder<Hesap, Hesap, QAfterFilterCondition> bankNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'bankName',
      ));
    });
  }

  QueryBuilder<Hesap, Hesap, QAfterFilterCondition> bankNameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'bankName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Hesap, Hesap, QAfterFilterCondition> bankNameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'bankName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Hesap, Hesap, QAfterFilterCondition> bankNameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'bankName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Hesap, Hesap, QAfterFilterCondition> bankNameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'bankName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Hesap, Hesap, QAfterFilterCondition> bankNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'bankName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Hesap, Hesap, QAfterFilterCondition> bankNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'bankName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Hesap, Hesap, QAfterFilterCondition> bankNameContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'bankName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Hesap, Hesap, QAfterFilterCondition> bankNameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'bankName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Hesap, Hesap, QAfterFilterCondition> bankNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'bankName',
        value: '',
      ));
    });
  }

  QueryBuilder<Hesap, Hesap, QAfterFilterCondition> bankNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'bankName',
        value: '',
      ));
    });
  }

  QueryBuilder<Hesap, Hesap, QAfterFilterCondition> ibanNumberIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'ibanNumber',
      ));
    });
  }

  QueryBuilder<Hesap, Hesap, QAfterFilterCondition> ibanNumberIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'ibanNumber',
      ));
    });
  }

  QueryBuilder<Hesap, Hesap, QAfterFilterCondition> ibanNumberEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ibanNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Hesap, Hesap, QAfterFilterCondition> ibanNumberGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'ibanNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Hesap, Hesap, QAfterFilterCondition> ibanNumberLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'ibanNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Hesap, Hesap, QAfterFilterCondition> ibanNumberBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'ibanNumber',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Hesap, Hesap, QAfterFilterCondition> ibanNumberStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'ibanNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Hesap, Hesap, QAfterFilterCondition> ibanNumberEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'ibanNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Hesap, Hesap, QAfterFilterCondition> ibanNumberContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'ibanNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Hesap, Hesap, QAfterFilterCondition> ibanNumberMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'ibanNumber',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Hesap, Hesap, QAfterFilterCondition> ibanNumberIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ibanNumber',
        value: '',
      ));
    });
  }

  QueryBuilder<Hesap, Hesap, QAfterFilterCondition> ibanNumberIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'ibanNumber',
        value: '',
      ));
    });
  }

  QueryBuilder<Hesap, Hesap, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Hesap, Hesap, QAfterFilterCondition> idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Hesap, Hesap, QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Hesap, Hesap, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Hesap, Hesap, QAfterFilterCondition> selectEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'select',
        value: value,
      ));
    });
  }
}

extension HesapQueryObject on QueryBuilder<Hesap, Hesap, QFilterCondition> {}

extension HesapQueryLinks on QueryBuilder<Hesap, Hesap, QFilterCondition> {}

extension HesapQuerySortBy on QueryBuilder<Hesap, Hesap, QSortBy> {
  QueryBuilder<Hesap, Hesap, QAfterSortBy> sortByBankName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bankName', Sort.asc);
    });
  }

  QueryBuilder<Hesap, Hesap, QAfterSortBy> sortByBankNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bankName', Sort.desc);
    });
  }

  QueryBuilder<Hesap, Hesap, QAfterSortBy> sortByIbanNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ibanNumber', Sort.asc);
    });
  }

  QueryBuilder<Hesap, Hesap, QAfterSortBy> sortByIbanNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ibanNumber', Sort.desc);
    });
  }

  QueryBuilder<Hesap, Hesap, QAfterSortBy> sortBySelect() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'select', Sort.asc);
    });
  }

  QueryBuilder<Hesap, Hesap, QAfterSortBy> sortBySelectDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'select', Sort.desc);
    });
  }
}

extension HesapQuerySortThenBy on QueryBuilder<Hesap, Hesap, QSortThenBy> {
  QueryBuilder<Hesap, Hesap, QAfterSortBy> thenByBankName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bankName', Sort.asc);
    });
  }

  QueryBuilder<Hesap, Hesap, QAfterSortBy> thenByBankNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bankName', Sort.desc);
    });
  }

  QueryBuilder<Hesap, Hesap, QAfterSortBy> thenByIbanNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ibanNumber', Sort.asc);
    });
  }

  QueryBuilder<Hesap, Hesap, QAfterSortBy> thenByIbanNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ibanNumber', Sort.desc);
    });
  }

  QueryBuilder<Hesap, Hesap, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Hesap, Hesap, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Hesap, Hesap, QAfterSortBy> thenBySelect() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'select', Sort.asc);
    });
  }

  QueryBuilder<Hesap, Hesap, QAfterSortBy> thenBySelectDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'select', Sort.desc);
    });
  }
}

extension HesapQueryWhereDistinct on QueryBuilder<Hesap, Hesap, QDistinct> {
  QueryBuilder<Hesap, Hesap, QDistinct> distinctByBankName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'bankName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Hesap, Hesap, QDistinct> distinctByIbanNumber(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'ibanNumber', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Hesap, Hesap, QDistinct> distinctBySelect() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'select');
    });
  }
}

extension HesapQueryProperty on QueryBuilder<Hesap, Hesap, QQueryProperty> {
  QueryBuilder<Hesap, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Hesap, String?, QQueryOperations> bankNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'bankName');
    });
  }

  QueryBuilder<Hesap, String?, QQueryOperations> ibanNumberProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'ibanNumber');
    });
  }

  QueryBuilder<Hesap, bool, QQueryOperations> selectProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'select');
    });
  }
}
