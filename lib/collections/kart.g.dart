// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kart.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

extension GetKartCollection on Isar {
  IsarCollection<Kart> get karts => this.collection();
}

const KartSchema = CollectionSchema(
  name: r'Kart',
  id: 7194912327970698853,
  properties: {
    r'cardName': PropertySchema(
      id: 0,
      name: r'cardName',
      type: IsarType.string,
    ),
    r'cardNumber': PropertySchema(
      id: 1,
      name: r'cardNumber',
      type: IsarType.string,
    ),
    r'cardOwner': PropertySchema(
      id: 2,
      name: r'cardOwner',
      type: IsarType.string,
    ),
    r'skt': PropertySchema(
      id: 3,
      name: r'skt',
      type: IsarType.string,
    )
  },
  estimateSize: _kartEstimateSize,
  serialize: _kartSerialize,
  deserialize: _kartDeserialize,
  deserializeProp: _kartDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _kartGetId,
  getLinks: _kartGetLinks,
  attach: _kartAttach,
  version: '3.0.5',
);

int _kartEstimateSize(
  Kart object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.cardName;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.cardNumber;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.cardOwner;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.skt;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _kartSerialize(
  Kart object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.cardName);
  writer.writeString(offsets[1], object.cardNumber);
  writer.writeString(offsets[2], object.cardOwner);
  writer.writeString(offsets[3], object.skt);
}

Kart _kartDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Kart();
  object.cardName = reader.readStringOrNull(offsets[0]);
  object.cardNumber = reader.readStringOrNull(offsets[1]);
  object.cardOwner = reader.readStringOrNull(offsets[2]);
  object.id = id;
  object.skt = reader.readStringOrNull(offsets[3]);
  return object;
}

P _kartDeserializeProp<P>(
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
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _kartGetId(Kart object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _kartGetLinks(Kart object) {
  return [];
}

void _kartAttach(IsarCollection<dynamic> col, Id id, Kart object) {
  object.id = id;
}

extension KartQueryWhereSort on QueryBuilder<Kart, Kart, QWhere> {
  QueryBuilder<Kart, Kart, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension KartQueryWhere on QueryBuilder<Kart, Kart, QWhereClause> {
  QueryBuilder<Kart, Kart, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Kart, Kart, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<Kart, Kart, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Kart, Kart, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Kart, Kart, QAfterWhereClause> idBetween(
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

extension KartQueryFilter on QueryBuilder<Kart, Kart, QFilterCondition> {
  QueryBuilder<Kart, Kart, QAfterFilterCondition> cardNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'cardName',
      ));
    });
  }

  QueryBuilder<Kart, Kart, QAfterFilterCondition> cardNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'cardName',
      ));
    });
  }

  QueryBuilder<Kart, Kart, QAfterFilterCondition> cardNameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'cardName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Kart, Kart, QAfterFilterCondition> cardNameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'cardName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Kart, Kart, QAfterFilterCondition> cardNameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'cardName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Kart, Kart, QAfterFilterCondition> cardNameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'cardName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Kart, Kart, QAfterFilterCondition> cardNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'cardName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Kart, Kart, QAfterFilterCondition> cardNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'cardName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Kart, Kart, QAfterFilterCondition> cardNameContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'cardName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Kart, Kart, QAfterFilterCondition> cardNameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'cardName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Kart, Kart, QAfterFilterCondition> cardNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'cardName',
        value: '',
      ));
    });
  }

  QueryBuilder<Kart, Kart, QAfterFilterCondition> cardNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'cardName',
        value: '',
      ));
    });
  }

  QueryBuilder<Kart, Kart, QAfterFilterCondition> cardNumberIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'cardNumber',
      ));
    });
  }

  QueryBuilder<Kart, Kart, QAfterFilterCondition> cardNumberIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'cardNumber',
      ));
    });
  }

  QueryBuilder<Kart, Kart, QAfterFilterCondition> cardNumberEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'cardNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Kart, Kart, QAfterFilterCondition> cardNumberGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'cardNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Kart, Kart, QAfterFilterCondition> cardNumberLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'cardNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Kart, Kart, QAfterFilterCondition> cardNumberBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'cardNumber',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Kart, Kart, QAfterFilterCondition> cardNumberStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'cardNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Kart, Kart, QAfterFilterCondition> cardNumberEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'cardNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Kart, Kart, QAfterFilterCondition> cardNumberContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'cardNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Kart, Kart, QAfterFilterCondition> cardNumberMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'cardNumber',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Kart, Kart, QAfterFilterCondition> cardNumberIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'cardNumber',
        value: '',
      ));
    });
  }

  QueryBuilder<Kart, Kart, QAfterFilterCondition> cardNumberIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'cardNumber',
        value: '',
      ));
    });
  }

  QueryBuilder<Kart, Kart, QAfterFilterCondition> cardOwnerIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'cardOwner',
      ));
    });
  }

  QueryBuilder<Kart, Kart, QAfterFilterCondition> cardOwnerIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'cardOwner',
      ));
    });
  }

  QueryBuilder<Kart, Kart, QAfterFilterCondition> cardOwnerEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'cardOwner',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Kart, Kart, QAfterFilterCondition> cardOwnerGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'cardOwner',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Kart, Kart, QAfterFilterCondition> cardOwnerLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'cardOwner',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Kart, Kart, QAfterFilterCondition> cardOwnerBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'cardOwner',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Kart, Kart, QAfterFilterCondition> cardOwnerStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'cardOwner',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Kart, Kart, QAfterFilterCondition> cardOwnerEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'cardOwner',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Kart, Kart, QAfterFilterCondition> cardOwnerContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'cardOwner',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Kart, Kart, QAfterFilterCondition> cardOwnerMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'cardOwner',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Kart, Kart, QAfterFilterCondition> cardOwnerIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'cardOwner',
        value: '',
      ));
    });
  }

  QueryBuilder<Kart, Kart, QAfterFilterCondition> cardOwnerIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'cardOwner',
        value: '',
      ));
    });
  }

  QueryBuilder<Kart, Kart, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Kart, Kart, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<Kart, Kart, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<Kart, Kart, QAfterFilterCondition> idBetween(
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

  QueryBuilder<Kart, Kart, QAfterFilterCondition> sktIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'skt',
      ));
    });
  }

  QueryBuilder<Kart, Kart, QAfterFilterCondition> sktIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'skt',
      ));
    });
  }

  QueryBuilder<Kart, Kart, QAfterFilterCondition> sktEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'skt',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Kart, Kart, QAfterFilterCondition> sktGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'skt',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Kart, Kart, QAfterFilterCondition> sktLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'skt',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Kart, Kart, QAfterFilterCondition> sktBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'skt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Kart, Kart, QAfterFilterCondition> sktStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'skt',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Kart, Kart, QAfterFilterCondition> sktEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'skt',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Kart, Kart, QAfterFilterCondition> sktContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'skt',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Kart, Kart, QAfterFilterCondition> sktMatches(String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'skt',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Kart, Kart, QAfterFilterCondition> sktIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'skt',
        value: '',
      ));
    });
  }

  QueryBuilder<Kart, Kart, QAfterFilterCondition> sktIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'skt',
        value: '',
      ));
    });
  }
}

extension KartQueryObject on QueryBuilder<Kart, Kart, QFilterCondition> {}

extension KartQueryLinks on QueryBuilder<Kart, Kart, QFilterCondition> {}

extension KartQuerySortBy on QueryBuilder<Kart, Kart, QSortBy> {
  QueryBuilder<Kart, Kart, QAfterSortBy> sortByCardName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cardName', Sort.asc);
    });
  }

  QueryBuilder<Kart, Kart, QAfterSortBy> sortByCardNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cardName', Sort.desc);
    });
  }

  QueryBuilder<Kart, Kart, QAfterSortBy> sortByCardNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cardNumber', Sort.asc);
    });
  }

  QueryBuilder<Kart, Kart, QAfterSortBy> sortByCardNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cardNumber', Sort.desc);
    });
  }

  QueryBuilder<Kart, Kart, QAfterSortBy> sortByCardOwner() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cardOwner', Sort.asc);
    });
  }

  QueryBuilder<Kart, Kart, QAfterSortBy> sortByCardOwnerDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cardOwner', Sort.desc);
    });
  }

  QueryBuilder<Kart, Kart, QAfterSortBy> sortBySkt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'skt', Sort.asc);
    });
  }

  QueryBuilder<Kart, Kart, QAfterSortBy> sortBySktDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'skt', Sort.desc);
    });
  }
}

extension KartQuerySortThenBy on QueryBuilder<Kart, Kart, QSortThenBy> {
  QueryBuilder<Kart, Kart, QAfterSortBy> thenByCardName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cardName', Sort.asc);
    });
  }

  QueryBuilder<Kart, Kart, QAfterSortBy> thenByCardNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cardName', Sort.desc);
    });
  }

  QueryBuilder<Kart, Kart, QAfterSortBy> thenByCardNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cardNumber', Sort.asc);
    });
  }

  QueryBuilder<Kart, Kart, QAfterSortBy> thenByCardNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cardNumber', Sort.desc);
    });
  }

  QueryBuilder<Kart, Kart, QAfterSortBy> thenByCardOwner() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cardOwner', Sort.asc);
    });
  }

  QueryBuilder<Kart, Kart, QAfterSortBy> thenByCardOwnerDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cardOwner', Sort.desc);
    });
  }

  QueryBuilder<Kart, Kart, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Kart, Kart, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Kart, Kart, QAfterSortBy> thenBySkt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'skt', Sort.asc);
    });
  }

  QueryBuilder<Kart, Kart, QAfterSortBy> thenBySktDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'skt', Sort.desc);
    });
  }
}

extension KartQueryWhereDistinct on QueryBuilder<Kart, Kart, QDistinct> {
  QueryBuilder<Kart, Kart, QDistinct> distinctByCardName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'cardName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Kart, Kart, QDistinct> distinctByCardNumber(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'cardNumber', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Kart, Kart, QDistinct> distinctByCardOwner(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'cardOwner', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Kart, Kart, QDistinct> distinctBySkt(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'skt', caseSensitive: caseSensitive);
    });
  }
}

extension KartQueryProperty on QueryBuilder<Kart, Kart, QQueryProperty> {
  QueryBuilder<Kart, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Kart, String?, QQueryOperations> cardNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'cardName');
    });
  }

  QueryBuilder<Kart, String?, QQueryOperations> cardNumberProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'cardNumber');
    });
  }

  QueryBuilder<Kart, String?, QQueryOperations> cardOwnerProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'cardOwner');
    });
  }

  QueryBuilder<Kart, String?, QQueryOperations> sktProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'skt');
    });
  }
}
