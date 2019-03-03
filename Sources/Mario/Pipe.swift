// Style: 80-columns, LLVM/Swift standard library
import Swift

/// A [Pipe](pipeline) provides you with a familiar syntactic convenience, aids
/// you in the process of creating and interpreting composed expressions and
/// simplifies working with tuples. All of this bundled in an extremely simple
/// implementation that guarantees to save you hours of work so you can focus
/// on what you most enjoy about your job: Leaving at 6.
///
/// Let the little Mario in you soar into the skies like a short, fat eagle,
/// watch him feel the wind slip beneath its thick black mustache...
///
/// Majestic.
///
/// ## Examples
///
///
///
/// ## Anatomy
///
/// ### Basic expression
///
///       ┌┬─╸identifier pattern
///     ┏━┷┷━┓
///     x |> ƒ
///     │ ├┘ └╸R identifier pattern
///     │ └───╸pipe operator
///     └─────╸L identifier pattern
///
/// * **Terms:** [identifier pattern](idenpat), [binary expression](biexp),
///              [pipe](pipeline), [operator](operators), [identifier](idens)
///
///     x |> ƒₐ |> ƒᵦ |> ··· |> ƒ
///     ║ ││ └     value
///     ║ │└── flow of data
///     ║ └─── [pipe](pipeline)
///     ╠───── literal, [&]value, object
///     ╚───── n-ary tuple
///
///
/// ## Usage
///
/// ### Familiar syntactic convenience
///
/// tuples as well as softening lesser known
/// semantics in Swift
///  semantics by softening
/// lesser known properties intrinsic to the language.
///
///
/// provide a different point of view
/// when writing aids your reasoning process when
/// writing and reading composed expressions, the
///
/// the
/// flow of multiple operation results the result of an operation
///
/// ### Basic grammar:
/// Pipes occupy the _operator_ space in a Swift [binary expression].
///     operator-head ☛ ➼ ❭❭❭ ❯❯❯ ❱❱❱ ═▶︎ ━▶︎ **|>** _or_ **<|**
///
/// * _operator-head_ ☛ |> | <|
///
/// -
///
///     x |> ƒₐ |> ƒᵦ |> ƒᵧ
///     └─────┘     │     │
///     └───────────┘     │
///     └─────────────────┘
///
/// ### Structure
/// `(|>)` precedence is one higher than that of its reverse (`<|`) allowing
/// nesting.
/// which allows `|>` to be nested in `<|`.
///
///
/// # Caveat
///
/// Parameter names can be ignored when using pipes, this can hurt readability
/// and create ambiguous expressions unsolvable by the type checker. In the
/// following example, Luigi will ask Swift to solve whether it should invoke
/// `String.prefix(upTo:)` or `String.prefix(through:)` by reading his mind:
///
///     let someText = "some text"
///     let result = 4 |> someText.prefix
///
/// Limitations in the language, however, preclude it from reading Luigi's mind,
/// giving rise to a compilation error. Poor Luigi.
///
/// Come Mario to the rescue! "Move aside, dumbass.", he says to his loving
/// little brother, and proceeds to solve the conundrum by providing the
/// function's full qualifying identifier, which includes the named arguments:
///
///     let result = 4 |> someText.prefix(through:)
///     // result == "some"
///
/// Mario leaves victorious while little Luigi stares at him, confused as usual,
/// and says: "But, but... The toilet's still broken.". But Mario is already
/// gone. And Luigi has nowhere else to go.
///
/// - Parameters:
///   - a: A value to pipe.
///   - λ: A function that takes `A` and returns a transformation.
/// - Returns: The result of mapping `a` into `λ`.
/// [biexp]: https://docs.swift.org/swift-book/ReferenceManual/Expressions.html#ID385
/// [pipeline]: https://en.wikipedia.org/wiki/Pipeline_(Unix)
/// [idens]: https://docs.swift.org/swift-book/ReferenceManual/LexicalStructure.html#ID412
/// [idenpat]: https://docs.swift.org/swift-book/ReferenceManual/Patterns.html#grammar_identifier-pattern
/// [operators]: https://docs.swift.org/swift-book/ReferenceManual/LexicalStructure.html#ID418
public enum Pipe {

    // MARK: Forward

    @inlinable
    @inline(__always)
    public static func map <Value, Result>(
        _ value: Value,
        into transform: (Value) -> Result
    ) -> Result {
        return transform(value)
    }

    @inlinable
    @inline(__always)
    @discardableResult
    public static func with <Value>(
        _ value: Value,
        perform sideEffect: (Value) -> ­_
    ) -> Value {
        sideEffect(value)
        return value
    }

    @inlinable
    @inline(__always)
    @discardableResult
    public static func mutate <Value>(
        _ mutableValue: inout Value,
        with mutate: (inout Value) -> ­_
    ) -> Value {
        return mutableValue |>> mutate
    }

    // MARK: Backwards

    @inlinable
    @inline(__always)
    public static func apply <Value, Result>(
        _ transform: (Value) -> Result,
        to value: Value
    ) -> Result {
        return transform(value)
    }

    @inlinable
    @inline(__always)
    @discardableResult
    public static func perform <Value>(
        _ sideEffect: (Value) -> ­_,
        with value: Value
    ) -> Value {
        return value |>> sideEffect
    }

    @inlinable
    @inline(__always)
    @discardableResult
    public static func with <Value>(
        _ mutate: (inout Value) -> ­_,
        mutate mutableValue: inout Value
    ) -> Value {
        return mutableValue |>> mutate
    }
}

public enum PipeT {

    // MARK: Forward

    @inlinable
    @inline(__always)
    public static func map <Value, Result>(
        _ value: Value,
        into transform: (Value) throws -> Result
    ) rethrows -> Result {
        return try transform(value)
    }

    @inlinable
    @inline(__always)
    @discardableResult
    public static func with <Value>(
        _ value: Value,
        perform sideEffect: (Value) throws -> ­_
    ) rethrows -> Value {
        _ = try sideEffect(value)
        return value
    }

    @inlinable
    @inline(__always)
    @discardableResult
    public static func mutate <Value>(
        _ mutableValue: inout Value,
        with mutate: (inout Value) throws -> ­_
    ) rethrows -> Value {
        _ = try mutate(&mutableValue)
        return mutableValue
    }

    // MARK: Backwards

    @inlinable
    @inline(__always)
    public static func apply <Value, Result>(
        _ transform: (Value) throws -> Result,
        to value: Value
    ) rethrows -> Result {
        return try transform(value)
    }

    @inlinable
    @inline(__always)
    @discardableResult
    public static func perform <Value>(
        _ sideEffect: (Value) throws -> ­_,
        with value: Value
    ) rethrows -> Value {
        _ = try sideEffect(value)
        return value
    }

    @inlinable
    @inline(__always)
    @discardableResult
    public static func with <Value>(
        _ mutate: (inout Value) throws -> ­_,
        mutate mutableValue: inout Value
    ) rethrows -> Value {
        _ = try mutate(&mutableValue)
        return mutableValue
    }
}
