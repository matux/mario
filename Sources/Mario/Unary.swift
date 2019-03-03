// Style: 80-columns, LLVM, Swift standard library
import Swift

/// Returns the result of calling the function on the right-hand side by passing
/// the value on the left-hand-side as an argument.
@_transparent
public func |> <Value, Result>(
    value: Value,
    transform: (Value) -> Result
) -> Result {
    return transform(value)
}

/// Returns the value on the left-hand side as is, after calling the function
/// on the right-hand side with the given value.
@inlinable
@inline(__always)
public func |>> <Value>(
    value: Value,
    transform: (Value) -> ­_
) -> Value {
    _ = transform(value)
    return value
}

/// Returns the value on the left-hand side as is, after calling the function
/// on the right-hand side with the given value.
@inlinable
@inline(__always)
public func &|>> <Value>(
    value: inout Value,
    transform: (inout Value) -> ­_
) -> Value {
    _ = transform(&value)
    return value
}


/// Returns the result of calling the function on the left-hand side by passing
/// the value on the right-hand-side as an argument.
@_transparent
public func <| <Value, Result>(
    value: Value,
    transform: (Value) -> Result
) -> Result {
    return transform(value)
}

/// Returns the value on the left-hand side as is, after calling the function
/// on the right-hand side with the given value.
@inlinable
@inline(__always)
public func <<| <Value>(
    value: Value,
    transform: (Value) -> ­_
) -> Value {
    _ = transform(value)
    return value
}
