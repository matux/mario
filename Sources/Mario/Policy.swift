import Swift

// MARK: Standard definitions

public typealias ­_ = Any

// MARK: Standard functions

/// Returns a constant function that will return `a` no matter what it is fed.
public func const<A>(_ a: A) -> (­_) -> A {
    return { _ in a }
}

// MARK: Precedence groups

/// Laid out by Mario and subsequently redone by Luigi following a rigurous
/// study of fixity and precedence primarily in Swift, C/C++, ❭λ=, OCaml, Scala
/// and F# among others.

// TODO: Rationale for prececence groups and operator shapes

precedencegroup FunctionCallPrecedence {
    associativity: right
    higherThan: FunctionArrowPrecedence
    lowerThan: TernaryPrecedence
}

precedencegroup FunctionMapPrecedence {
    associativity: left
    higherThan: FunctionCallPrecedence
    lowerThan: TernaryPrecedence
}

precedencegroup ApplicationPrecedence {
    associativity: left
    higherThan: NilCoalescingPrecedence
    lowerThan: CastingPrecedence
}

infix operator ¦   : ApplicationPrecedence // Left-associative pipe
infix operator <|  : FunctionArrowPrecedence // Immutable value or mutable ref
infix operator |>  : FunctionMapPrecedence // // Immutable value or mutable ref
infix operator |>> : FunctionMapPrecedence // Passtrhu side effect

infix operator &> : FunctionMapPrecedence // Pass-by-inout
infix operator ?> : FunctionMapPrecedence // Safe-unwrap Optional or Result
infix operator /> : FunctionMapPrecedence // All elements in collection 1-by-1 (map)


// MARK: - Internal Reference cards

// Nothing down below is required to understand how to use the library, not even
// to understand its inner workings, none of it has been declared anywhere or is
// planned to be declared. These are reference cards. For reference only. That
// is, -internal- reference. To be referenced internally. Not by library users.

///  ╌───────────────────────────────────────────────────╌
///   ∎   Precedence Group Table Reference
///  ╌───────────────────────────────────────────────────╌
///
///     ** Purely referential **
///
///  _Darken Comments to improve legibility_
///
///      name                                       fix ❭λ=
///   ╷·╶────────────────────────────────────────╴·╷
//    │  AssignmentPrec. &= |= ^= %= /= *= += -= = │ r⁻
///   │  FunctionArrowPrecedence            ->  <| │ r⁰ $
///   │  FunctionMapPrecedence          .^ >>=  |> │ l¹ & <&> >>  >>= =>>
///   │  CompositionPrecedence     <<< <=< >=> >>> │ r¹   >>> >=> =<< <<=
//    │  TernaryPrecedence                      ?: │ r¹
//    │  DefaultPrecedence                         │  ²
///   │  DisjunctionPrecedence             <|>  || │ l²    <|> >|<
///   │  CompetitionPrecedence             +++ ||| │ r² || ||| +++
///   │  ConjunctionPrecedence                  && │ l³
///   │  CooperationPrecedence             *** &&& │ r³ && &&& ***
//    │  ComparisonPrecedence      ~= == ≠ < > ≤ ≥ │  ⁴ .= ?= %= += -= *= /=
///   │  ApplicationPrecedence             <*> <^> │ l⁴ <$> <*> <@> >$< >*<
///   │  LensingPrecedence                •~ ?= .= │ r⁴ .~ ?~ %~ +~ -~ *~ /~
//    │  NilCoalescingPrecedence                ?? │ r⁴
//    │  CastingPrecedence           is as as? as! │  ⁵
//    │  RangeFormationPrecedence          ... ..< │  ⁵
///   │  AmalgamationPrecedence                 ++ │ r⁵ ++ :+:
//    │  AdditionPrecedence          | ^ &- &+ - + │ l⁶
///   │  CartesianPrecedence                    <> │ r⁶ <> :*:
//    │  MultiplicationPrecedence & &% &/ &* % / * │ l⁷
///   │  ExponentiationPrecedence               ** │ r⁸ ^ ^^ **
//    │  BitwiseShiftPrecedence              << >> │  ⁹
///   │  λCompositionPrecedence                  ◦ │ r⁹  .
///   │  λApplicationPrecedence               () • │ l¹⁰ ⎵
///   ╵·╶────────────────────────────────────────╴·╵
///

