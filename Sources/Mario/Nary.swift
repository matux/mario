import Swift

// MARK: - Implicitly curried piping

// MARK: Forward

/// Returns a partially applied function with the passed value fixed to the
/// first argument of a binary function.
///
/// Left-associatively maps the argument on the right hand side to the first
/// first argument of the binary function on the right hand side and returns a
/// new function accepting the final argument which once applied will yield its
/// result.
///
/// Left-associativity enables composition without currying:
///
///     let result = ƒ |> argₐ <|| argᵦ
///
/// Partially applied functions can be stored for later application:
///
///     let partial = ƒ <|| argₐ
///     let result = partial <|| argᵦ
///
/// - Note: Operator usage hides parameter names which can hurt readability. In
///   the following example, are we invoking `reduce(_:_:)` or `reduce(into:_:)`?
///
///       [0, 1, 2, 3].reduce <|| x <|| (+)
///
/// - Parameters:
///   - λ: A binary function to partially apply.
///   - a: A value to fix the first argument of the function to.
/// - Returns: A new function accepting the final argument which once mapped
///   will yield the result of applying the entire function.
@_transparent
public func |> <A, B, Result>(
    λ: @escaping (A, B) -> Result,
    a: A
) -> (B) -> Result {
    return { b in λ(a, b) }
}

// MARK: Ternary

/// Returns a partially applied function with the passed value fixed to the
/// first argument of a ternary function.
///
/// Left-associatively maps the argument on the right hand side to the first
/// first argument of the ternary function on the right hand side and returns a
/// new binary function accepting the final arguments which once applied will
/// yield the final result.
///
/// Left-associativity enables composition without currying:
///
///     let result = ƒ <|| arg₁ <|| arg₂ <|| arg₃
///
/// Partially applied functions can be stored for later application:
///
///     let partial = ƒ <|| arg₁
///     let result = partial <|| arg₂ <|| arg₃
///
/// - Note: Operator usage hides parameter names which can hurt readability. In
///   the following example, are we invoking `reduce(_:_:)` or `reduce(into:_:)`?
///
///       [0, 1, 2, 3].reduce <|| x <|| (+)
///
/// - Parameters:
///   - λ: A ternary function to partially apply.
///   - a: A value to fix the first argument of the function.
/// - Returns: A new function accepting the final arguments which once mapped
///   will yield the result of applying the entire function.
@_transparent
public func |> <A, B, C, Result>(
    λ: @escaping (A, B, C) -> Result,
    a: A
) -> (B, C) -> Result {
    return { b, c in λ(a, b, c) }
}

// MARK: Quaternary

/// Returns a partially applied function with the passed value fixed to the
/// first argument of a quaternary function.
///
/// Left-associatively maps the argument on the right hand side to the first
/// first argument of the quaternary function on the right hand side and returns
/// a new ternary function accepting the final arguments which once applied will
/// yield the final result.
///
/// Left-associativity enables composition without currying:
///
///     let result = ƒ <|| arg₁ <|| arg₂ <|| arg₃ <|| arg₄
///
/// Partially applied functions can be stored for later application:
///
///     let partial = ƒ <|| arg₁ <|| arg₂
///     let result = partial <|| arg₃ <|| arg₄
///
/// - Note: Operator usage hides parameter names which can hurt readability. In
///   the following example, are we invoking `reduce(_:_:)` or `reduce(into:_:)`?
///
///       [0, 1, 2, 3].reduce <|| x <|| (+)
///
/// - Parameters:
///   - λ: A quaternary function to partially apply.
///   - a: A value to fix the first argument of the function.
/// - Returns: A new function accepting the final arguments which once mapped
///   will yield the result of applying the entire function.
@_transparent
public func |> <A, B, C, D, Result>(
    λ: @escaping (A, B, C, D) -> Result,
    a: A
) -> (B, C, D) -> Result {
    return { b, c, d in λ(a, b, c, d) }
}

// MARK: Quinary

/// Returns a partially applied function with the passed value fixed to the
/// first argument of a quinary function.
///
/// Left-associatively maps the argument on the right hand side to the first
/// first argument of the quaternary function on the right hand side and returns
/// a new ternary function accepting the final arguments which once applied will
/// yield the final result.
///
/// Left-associativity enables composition without currying:
///
///     let result = ƒ <|| arg₁ <|| arg₂ <|| arg₃ <|| arg₄
///
/// Partially applied functions can be stored for later application:
///
///     let partial = ƒ <|| arg₁ <|| arg₂
///     let result = partial <|| arg₃ <|| arg₄
///
/// - Note: Operator usage hides parameter names which can hurt readability. In
///   the following example, are we invoking `reduce(_:_:)` or `reduce(into:_:)`?
///
///       [0, 1, 2, 3].reduce <|| x <|| (+)
///
/// - Parameters:
///   - λ: A quaternary function to partially apply.
///   - a: A value to fix the first argument of the function.
/// - Returns: A new function accepting the final arguments which once mapped
///   will yield the result of applying the entire function.
@_transparent
public func |> <A, B, C, D, E, Result>(
    λ: @escaping (A, B, C, D, E) -> Result,
    a: A
) -> (B, C, D, E) -> Result {
    return { b, c, d, e in λ(a, b, c, d, e) }
}

// MARK: Backward

// MARK: Binary

/// Returns a partially applied function with the passed value fixed to the
/// first argument of a binary function.
///
/// Left-associatively maps the argument on the right hand side to the first
/// first argument of the binary function on the right hand side and returns a
/// new function accepting the final argument which once applied will yield its
/// result.
///
/// Left-associativity enables composition without currying:
///
///     let result = ƒ <| argₐ <| argᵦ
///
/// Partially applied functions can be stored for later application:
///
///     let partial = ƒ <| argₐ
///     let result = partial <| argᵦ
///
/// - Note: Operator usage hides parameter names which can hurt readability. In
///   the following example, are we invoking `reduce(_:_:)` or `reduce(into:_:)`?
///
///       [0, 1, 2, 3].reduce <| x <| (+)
///
/// - Parameters:
///   - λ: A binary function to partially apply.
///   - a: A value to fix the first argument of the function to.
/// - Returns: A new function accepting the final argument which once mapped
///   will yield the result of applying the entire function.
@_transparent
public func <| <A, B, Result>(
    λ: @escaping (A, B) -> Result,
    a: A
) -> (B) -> Result {
    return { b in λ(a, b) }
}

// MARK: Ternary

/// Returns a partially applied function with the passed value fixed to the
/// first argument of a ternary function.
///
/// Left-associatively maps the argument on the right hand side to the first
/// first argument of the ternary function on the right hand side and returns a
/// new binary function accepting the final arguments which once applied will
/// yield the final result.
///
/// Left-associativity enables composition without currying:
///
///     let result = ƒ <| arg₁ <| arg₂ <| arg₃
///
/// Partially applied functions can be stored for later application:
///
///     let partial = ƒ <| arg₁
///     let result = partial <| arg₂ <| arg₃
///
/// - Note: Operator usage hides parameter names which can hurt readability. In
///   the following example, are we invoking `reduce(_:_:)` or `reduce(into:_:)`?
///
///       [0, 1, 2, 3].reduce <| x <| (+)
///
/// - Parameters:
///   - λ: A ternary function to partially apply.
///   - a: A value to fix the first argument of the function.
/// - Returns: A new function accepting the final arguments which once mapped
///   will yield the result of applying the entire function.
@_transparent
public func <| <A, B, C, Result>(
    λ: @escaping (A, B, C) -> Result,
    a: A
) -> (B, C) -> Result {
    return { b, c in λ(a, b, c) }
}

// MARK: Quaternary

/// Returns a partially applied function with the passed value fixed to the
/// first argument of a quaternary function.
///
/// Left-associatively maps the argument on the right hand side to the first
/// first argument of the quaternary function on the right hand side and returns
/// a new ternary function accepting the final arguments which once applied will
/// yield the final result.
///
/// Left-associativity enables composition without currying:
///
///     let result = ƒ <| arg₁ <| arg₂ <| arg₃ <| arg₄
///
/// Partially applied functions can be stored for later application:
///
///     let partial = ƒ <| arg₁ <| arg₂
///     let result = partial <| arg₃ <| arg₄
///
/// - Note: Operator usage hides parameter names which can hurt readability. In
///   the following example, are we invoking `reduce(_:_:)` or `reduce(into:_:)`?
///
///       [0, 1, 2, 3].reduce <| x <| (+)
///
/// - Parameters:
///   - λ: A quaternary function to partially apply.
///   - a: A value to fix the first argument of the function.
/// - Returns: A new function accepting the final arguments which once mapped
///   will yield the result of applying the entire function.
@_transparent
public func <| <A, B, C, D, Result>(
    λ: @escaping (A, B, C, D) -> Result,
    a: A
) -> (B, C, D) -> Result {
    return { b, c, d in λ(a, b, c, d) }
}

// MARK: Quinary

/// Returns a partially applied function with the passed value fixed to the
/// first argument of a quinary function.
///
/// Left-associatively maps the argument on the right hand side to the first
/// first argument of the quaternary function on the right hand side and returns
/// a new ternary function accepting the final arguments which once applied will
/// yield the final result.
///
/// Left-associativity enables composition without currying:
///
///     let result = ƒ <| arg₁ <| arg₂ <| arg₃ <| arg₄
///
/// Partially applied functions can be stored for later application:
///
///     let partial = ƒ <| arg₁ <| arg₂
///     let result = partial <| arg₃ <| arg₄
///
/// - Note: Operator usage hides parameter names which can hurt readability. In
///   the following example, are we invoking `reduce(_:_:)` or `reduce(into:_:)`?
///
///       [0, 1, 2, 3].reduce <| x <| (+)
///
/// - Parameters:
///   - λ: A quaternary function to partially apply.
///   - a: A value to fix the first argument of the function.
/// - Returns: A new function accepting the final arguments which once mapped
///   will yield the result of applying the entire function.
@_transparent
public func <| <A, B, C, D, E, Result>(
    λ: @escaping (A, B, C, D, E) -> Result,
    a: A
) -> (B, C, D, E) -> Result {
    return { b, c, d, e in λ(a, b, c, d, e) }
}

