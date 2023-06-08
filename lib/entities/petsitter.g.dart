// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'petsitter.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetPetsitterCollection on Isar {
  IsarCollection<Petsitter> get petsitters => this.collection();
}

const PetsitterSchema = CollectionSchema(
  name: r'Petsitter',
  id: -6194993992545944672,
  properties: {
    r'birthDate': PropertySchema(
      id: 0,
      name: r'birthDate',
      type: IsarType.dateTime,
    ),
    r'description': PropertySchema(
      id: 1,
      name: r'description',
      type: IsarType.string,
    ),
    r'fname': PropertySchema(
      id: 2,
      name: r'fname',
      type: IsarType.string,
    ),
    r'followers': PropertySchema(
      id: 3,
      name: r'followers',
      type: IsarType.long,
    ),
    r'lname': PropertySchema(
      id: 4,
      name: r'lname',
      type: IsarType.string,
    ),
    r'rating': PropertySchema(
      id: 5,
      name: r'rating',
      type: IsarType.long,
    )
  },
  estimateSize: _petsitterEstimateSize,
  serialize: _petsitterSerialize,
  deserialize: _petsitterDeserialize,
  deserializeProp: _petsitterDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {
    r'pet': LinkSchema(
      id: -597850718666971526,
      name: r'pet',
      target: r'Pet',
      single: false,
    )
  },
  embeddedSchemas: {},
  getId: _petsitterGetId,
  getLinks: _petsitterGetLinks,
  attach: _petsitterAttach,
  version: '3.1.0',
);

int _petsitterEstimateSize(
  Petsitter object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.description.length * 3;
  bytesCount += 3 + object.fname.length * 3;
  bytesCount += 3 + object.lname.length * 3;
  return bytesCount;
}

void _petsitterSerialize(
  Petsitter object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.birthDate);
  writer.writeString(offsets[1], object.description);
  writer.writeString(offsets[2], object.fname);
  writer.writeLong(offsets[3], object.followers);
  writer.writeString(offsets[4], object.lname);
  writer.writeLong(offsets[5], object.rating);
}

Petsitter _petsitterDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Petsitter();
  object.birthDate = reader.readDateTime(offsets[0]);
  object.description = reader.readString(offsets[1]);
  object.fname = reader.readString(offsets[2]);
  object.followers = reader.readLong(offsets[3]);
  object.id = id;
  object.lname = reader.readString(offsets[4]);
  object.rating = reader.readLong(offsets[5]);
  return object;
}

P _petsitterDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDateTime(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readLong(offset)) as P;
    case 4:
      return (reader.readString(offset)) as P;
    case 5:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _petsitterGetId(Petsitter object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _petsitterGetLinks(Petsitter object) {
  return [object.pet];
}

void _petsitterAttach(IsarCollection<dynamic> col, Id id, Petsitter object) {
  object.id = id;
  object.pet.attach(col, col.isar.collection<Pet>(), r'pet', id);
}

extension PetsitterQueryWhereSort
    on QueryBuilder<Petsitter, Petsitter, QWhere> {
  QueryBuilder<Petsitter, Petsitter, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension PetsitterQueryWhere
    on QueryBuilder<Petsitter, Petsitter, QWhereClause> {
  QueryBuilder<Petsitter, Petsitter, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Petsitter, Petsitter, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<Petsitter, Petsitter, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Petsitter, Petsitter, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Petsitter, Petsitter, QAfterWhereClause> idBetween(
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

extension PetsitterQueryFilter
    on QueryBuilder<Petsitter, Petsitter, QFilterCondition> {
  QueryBuilder<Petsitter, Petsitter, QAfterFilterCondition> birthDateEqualTo(
      DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'birthDate',
        value: value,
      ));
    });
  }

  QueryBuilder<Petsitter, Petsitter, QAfterFilterCondition>
      birthDateGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'birthDate',
        value: value,
      ));
    });
  }

  QueryBuilder<Petsitter, Petsitter, QAfterFilterCondition> birthDateLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'birthDate',
        value: value,
      ));
    });
  }

  QueryBuilder<Petsitter, Petsitter, QAfterFilterCondition> birthDateBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'birthDate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Petsitter, Petsitter, QAfterFilterCondition> descriptionEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Petsitter, Petsitter, QAfterFilterCondition>
      descriptionGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Petsitter, Petsitter, QAfterFilterCondition> descriptionLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Petsitter, Petsitter, QAfterFilterCondition> descriptionBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'description',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Petsitter, Petsitter, QAfterFilterCondition>
      descriptionStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Petsitter, Petsitter, QAfterFilterCondition> descriptionEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Petsitter, Petsitter, QAfterFilterCondition> descriptionContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Petsitter, Petsitter, QAfterFilterCondition> descriptionMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'description',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Petsitter, Petsitter, QAfterFilterCondition>
      descriptionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<Petsitter, Petsitter, QAfterFilterCondition>
      descriptionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<Petsitter, Petsitter, QAfterFilterCondition> fnameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fname',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Petsitter, Petsitter, QAfterFilterCondition> fnameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'fname',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Petsitter, Petsitter, QAfterFilterCondition> fnameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'fname',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Petsitter, Petsitter, QAfterFilterCondition> fnameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'fname',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Petsitter, Petsitter, QAfterFilterCondition> fnameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'fname',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Petsitter, Petsitter, QAfterFilterCondition> fnameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'fname',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Petsitter, Petsitter, QAfterFilterCondition> fnameContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'fname',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Petsitter, Petsitter, QAfterFilterCondition> fnameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'fname',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Petsitter, Petsitter, QAfterFilterCondition> fnameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fname',
        value: '',
      ));
    });
  }

  QueryBuilder<Petsitter, Petsitter, QAfterFilterCondition> fnameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'fname',
        value: '',
      ));
    });
  }

  QueryBuilder<Petsitter, Petsitter, QAfterFilterCondition> followersEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'followers',
        value: value,
      ));
    });
  }

  QueryBuilder<Petsitter, Petsitter, QAfterFilterCondition>
      followersGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'followers',
        value: value,
      ));
    });
  }

  QueryBuilder<Petsitter, Petsitter, QAfterFilterCondition> followersLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'followers',
        value: value,
      ));
    });
  }

  QueryBuilder<Petsitter, Petsitter, QAfterFilterCondition> followersBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'followers',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Petsitter, Petsitter, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Petsitter, Petsitter, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<Petsitter, Petsitter, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<Petsitter, Petsitter, QAfterFilterCondition> idBetween(
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

  QueryBuilder<Petsitter, Petsitter, QAfterFilterCondition> lnameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lname',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Petsitter, Petsitter, QAfterFilterCondition> lnameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'lname',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Petsitter, Petsitter, QAfterFilterCondition> lnameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'lname',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Petsitter, Petsitter, QAfterFilterCondition> lnameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'lname',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Petsitter, Petsitter, QAfterFilterCondition> lnameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'lname',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Petsitter, Petsitter, QAfterFilterCondition> lnameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'lname',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Petsitter, Petsitter, QAfterFilterCondition> lnameContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'lname',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Petsitter, Petsitter, QAfterFilterCondition> lnameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'lname',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Petsitter, Petsitter, QAfterFilterCondition> lnameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lname',
        value: '',
      ));
    });
  }

  QueryBuilder<Petsitter, Petsitter, QAfterFilterCondition> lnameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'lname',
        value: '',
      ));
    });
  }

  QueryBuilder<Petsitter, Petsitter, QAfterFilterCondition> ratingEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'rating',
        value: value,
      ));
    });
  }

  QueryBuilder<Petsitter, Petsitter, QAfterFilterCondition> ratingGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'rating',
        value: value,
      ));
    });
  }

  QueryBuilder<Petsitter, Petsitter, QAfterFilterCondition> ratingLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'rating',
        value: value,
      ));
    });
  }

  QueryBuilder<Petsitter, Petsitter, QAfterFilterCondition> ratingBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'rating',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension PetsitterQueryObject
    on QueryBuilder<Petsitter, Petsitter, QFilterCondition> {}

extension PetsitterQueryLinks
    on QueryBuilder<Petsitter, Petsitter, QFilterCondition> {
  QueryBuilder<Petsitter, Petsitter, QAfterFilterCondition> pet(
      FilterQuery<Pet> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'pet');
    });
  }

  QueryBuilder<Petsitter, Petsitter, QAfterFilterCondition> petLengthEqualTo(
      int length) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'pet', length, true, length, true);
    });
  }

  QueryBuilder<Petsitter, Petsitter, QAfterFilterCondition> petIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'pet', 0, true, 0, true);
    });
  }

  QueryBuilder<Petsitter, Petsitter, QAfterFilterCondition> petIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'pet', 0, false, 999999, true);
    });
  }

  QueryBuilder<Petsitter, Petsitter, QAfterFilterCondition> petLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'pet', 0, true, length, include);
    });
  }

  QueryBuilder<Petsitter, Petsitter, QAfterFilterCondition>
      petLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'pet', length, include, 999999, true);
    });
  }

  QueryBuilder<Petsitter, Petsitter, QAfterFilterCondition> petLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'pet', lower, includeLower, upper, includeUpper);
    });
  }
}

extension PetsitterQuerySortBy on QueryBuilder<Petsitter, Petsitter, QSortBy> {
  QueryBuilder<Petsitter, Petsitter, QAfterSortBy> sortByBirthDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'birthDate', Sort.asc);
    });
  }

  QueryBuilder<Petsitter, Petsitter, QAfterSortBy> sortByBirthDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'birthDate', Sort.desc);
    });
  }

  QueryBuilder<Petsitter, Petsitter, QAfterSortBy> sortByDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.asc);
    });
  }

  QueryBuilder<Petsitter, Petsitter, QAfterSortBy> sortByDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.desc);
    });
  }

  QueryBuilder<Petsitter, Petsitter, QAfterSortBy> sortByFname() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fname', Sort.asc);
    });
  }

  QueryBuilder<Petsitter, Petsitter, QAfterSortBy> sortByFnameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fname', Sort.desc);
    });
  }

  QueryBuilder<Petsitter, Petsitter, QAfterSortBy> sortByFollowers() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'followers', Sort.asc);
    });
  }

  QueryBuilder<Petsitter, Petsitter, QAfterSortBy> sortByFollowersDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'followers', Sort.desc);
    });
  }

  QueryBuilder<Petsitter, Petsitter, QAfterSortBy> sortByLname() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lname', Sort.asc);
    });
  }

  QueryBuilder<Petsitter, Petsitter, QAfterSortBy> sortByLnameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lname', Sort.desc);
    });
  }

  QueryBuilder<Petsitter, Petsitter, QAfterSortBy> sortByRating() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rating', Sort.asc);
    });
  }

  QueryBuilder<Petsitter, Petsitter, QAfterSortBy> sortByRatingDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rating', Sort.desc);
    });
  }
}

extension PetsitterQuerySortThenBy
    on QueryBuilder<Petsitter, Petsitter, QSortThenBy> {
  QueryBuilder<Petsitter, Petsitter, QAfterSortBy> thenByBirthDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'birthDate', Sort.asc);
    });
  }

  QueryBuilder<Petsitter, Petsitter, QAfterSortBy> thenByBirthDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'birthDate', Sort.desc);
    });
  }

  QueryBuilder<Petsitter, Petsitter, QAfterSortBy> thenByDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.asc);
    });
  }

  QueryBuilder<Petsitter, Petsitter, QAfterSortBy> thenByDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.desc);
    });
  }

  QueryBuilder<Petsitter, Petsitter, QAfterSortBy> thenByFname() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fname', Sort.asc);
    });
  }

  QueryBuilder<Petsitter, Petsitter, QAfterSortBy> thenByFnameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fname', Sort.desc);
    });
  }

  QueryBuilder<Petsitter, Petsitter, QAfterSortBy> thenByFollowers() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'followers', Sort.asc);
    });
  }

  QueryBuilder<Petsitter, Petsitter, QAfterSortBy> thenByFollowersDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'followers', Sort.desc);
    });
  }

  QueryBuilder<Petsitter, Petsitter, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Petsitter, Petsitter, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Petsitter, Petsitter, QAfterSortBy> thenByLname() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lname', Sort.asc);
    });
  }

  QueryBuilder<Petsitter, Petsitter, QAfterSortBy> thenByLnameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lname', Sort.desc);
    });
  }

  QueryBuilder<Petsitter, Petsitter, QAfterSortBy> thenByRating() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rating', Sort.asc);
    });
  }

  QueryBuilder<Petsitter, Petsitter, QAfterSortBy> thenByRatingDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rating', Sort.desc);
    });
  }
}

extension PetsitterQueryWhereDistinct
    on QueryBuilder<Petsitter, Petsitter, QDistinct> {
  QueryBuilder<Petsitter, Petsitter, QDistinct> distinctByBirthDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'birthDate');
    });
  }

  QueryBuilder<Petsitter, Petsitter, QDistinct> distinctByDescription(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'description', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Petsitter, Petsitter, QDistinct> distinctByFname(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fname', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Petsitter, Petsitter, QDistinct> distinctByFollowers() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'followers');
    });
  }

  QueryBuilder<Petsitter, Petsitter, QDistinct> distinctByLname(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lname', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Petsitter, Petsitter, QDistinct> distinctByRating() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'rating');
    });
  }
}

extension PetsitterQueryProperty
    on QueryBuilder<Petsitter, Petsitter, QQueryProperty> {
  QueryBuilder<Petsitter, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Petsitter, DateTime, QQueryOperations> birthDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'birthDate');
    });
  }

  QueryBuilder<Petsitter, String, QQueryOperations> descriptionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'description');
    });
  }

  QueryBuilder<Petsitter, String, QQueryOperations> fnameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fname');
    });
  }

  QueryBuilder<Petsitter, int, QQueryOperations> followersProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'followers');
    });
  }

  QueryBuilder<Petsitter, String, QQueryOperations> lnameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lname');
    });
  }

  QueryBuilder<Petsitter, int, QQueryOperations> ratingProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'rating');
    });
  }
}
