type suite
type vitest

@module("vitest") @val external suite: suite = "expect"
@send external assertions: (suite, int) => unit = "assertions"

@send external hasAssertions: suite => unit = "hasAssertions"

type expected<'a>

@module("vitest") external expect: 'a => expected<'a> = "expect"

%%private(
  external cast_expected: expected<'a> => expected<'b> = "%identity"
  external unwrap: expected<'a> => 'a = "%identity"
  external wrap: 'a => expected<'a> = "%identity"
)
module type Runner = {
  let describe: (string, unit => Js.undefined<unit>, Js.undefined<int>) => unit
  let test: (string, unit => Js.undefined<unit>, Js.undefined<int>) => unit
  let testAsync: (string, unit => promise<unit>, Js.undefined<int>) => unit
}

module MakeRunner = (Runner: Runner) => {
  @inline
  let describe = (name, ~timeout=?, callback) =>
    Runner.describe(
      name,
      () => {
        callback()
        Js.undefined
      },
      timeout->Js.Undefined.fromOption,
    )
  @inline
  let test = (name, ~timeout=?, callback) =>
    Runner.test(
      name,
      () => {
        callback(suite)
        Js.undefined
      },
      timeout->Js.Undefined.fromOption,
    )

  @inline
  let testAsync = (name, ~timeout=?, callback) =>
    Runner.testAsync(
      name,
      () => {
        callback(suite)
      },
      timeout->Js.Undefined.fromOption,
    )
}

include MakeRunner({
  @module("vitest") @val
  external describe: (string, @uncurry (unit => Js.undefined<unit>), Js.undefined<int>) => unit =
    "describe"
  @module("vitest") @val
  external test: (string, @uncurry (unit => Js.undefined<unit>), Js.undefined<int>) => unit = "test"
  @module("vitest") @val
  external testAsync: (string, @uncurry (unit => promise<unit>), Js.undefined<int>) => unit = "test"
})

module Matchers = (
  Config: {
    type return<'a>
    let emptyReturn: return<'a>
  },
) => {
  @get external not: expected<'a> => expected<'a> = "not"

  @send external toBe: (expected<'a>, 'a) => Config.return<'a> = "toBe"

  @send external eq: (expected<'a>, 'a) => Config.return<'a> = "eq"

  @send external toBeDefined: expected<Js.undefined<'a>> => Config.return<'a> = "toBeDefined"

  @send external toBeUndefined: expected<Js.undefined<'a>> => Config.return<'a> = "toBeUndefined"

  @send external toBeTruthy: expected<'a> => Config.return<'a> = "toBeTruthy"

  @send external toBeFalsy: expected<'a> => Config.return<'a> = "toBeFalsy"

  @send external toBeNull: expected<Js.null<'a>> => Config.return<'a> = "toBeNull"

  // vitest + jest-dom
  @send external toBeInTheDocument: expected<'a> => Config.return<'a> = "toBeInTheDocument"
  @send external toBeDisabled: expected<'a> => Config.return<'a> = "toBeDisabled"
  @send external toHaveValue: (expected<'a>, string) => Config.return<'a> = "toHaveValue"
  // end vitest + jest-dom

  // @send external toBeInstanceOf: (expected<'a>, ?) => Config.return<'a> = "toBeInstanceOf"

  @send external toEqual: (expected<'a>, 'a) => Config.return<'a> = "toEqual"
  @inline
  let toBeSome = (~some=?, expected: expected<option<'a>>) => {
    expected->cast_expected->not->toBeUndefined->ignore
    switch some {
    | Some(id) => expected->toEqual(id)
    | None => Config.emptyReturn
    }
  }

  @inline
  let toBeNone = (expected: expected<option<'a>>) => {
    expected->cast_expected->toBeUndefined
  }

  @send external toStrictEqual: (expected<'a>, 'a) => Config.return<'a> = "toStrictEqual"

  @send external toContain: (expected<array<'a>>, 'a) => Config.return<'a> = "toContain"

  @send external toContainEqual: (expected<array<'a>>, 'a) => Config.return<'a> = "toContainEqual"

  @send external toMatchSnapshot: expected<'a> => Config.return<'a> = "toMatchSnapshot"

  @send
  external toThrow: (expected<unit => 'a>, Js.undefined<string>) => Config.return<'a> = "toThrow"
  @inline
  let toThrow = (~message=?, expected) => expected->toThrow(message->Js.Undefined.fromOption)

  @send
  external toThrowError: (expected<unit => 'a>, Js.undefined<string>) => Config.return<'a> =
    "toThrowError"
  @inline
  let toThrowError = (~message=?, expected) =>
    expected->toThrowError(message->Js.Undefined.fromOption)

  module Int = {
    type t = int
    type expected = expected<t>

    @send external toBeGreaterThan: (expected, t) => Config.return<'a> = "toBeGreaterThan"

    @send
    external toBeGreaterThanOrEqual: (expected, t) => Config.return<'a> = "toBeGreaterThanOrEqual"

    @send external toBeLessThan: (expected, t) => Config.return<'a> = "toBeLessThan"

    @send external toBeLessThanOrEqual: (expected, t) => Config.return<'a> = "toBeLessThanOrEqual"
  }

  module Float = {
    type t = float
    type expected = expected<t>

    @send external toBeNaN: expected => Config.return<'a> = "toBeNaN"

    @send
    external toBeClosedTo: (expected, t, int) => Config.return<'a> = "toBeClosedTo"

    @send
    external toBeGreaterThan: (expected, t) => Config.return<'a> = "toBeGreaterThan"

    @send
    external toBeGreaterThanOrEqual: (expected, t) => Config.return<'a> = "toBeGreaterThanOrEqual"

    @send
    external toBeLessThan: (expected, t) => Config.return<'a> = "toBeLessThan"

    @send
    external toBeLessThanOrEqual: (expected, t) => Config.return<'a> = "toBeLessThanOrEqual"
  }

  module String = {
    type t = string
    type expected = expected<t>

    @send external toContain: (expected, t) => Config.return<'a> = "toContain"

    @send external toHaveLength: (expected, int) => Config.return<'a> = "toHaveLength"

    @send external toMatch: (expected, Js.Re.t) => Config.return<'a> = "toMatch"
  }

  module Array = {
    @send external toContain: (expected<array<'a>>, 'a) => Config.return<'a> = "toContain"

    @send external toHaveLength: (expected<array<'a>>, int) => Config.return<'a> = "toHaveLength"

    @send
    external toMatch: (expected<array<'a>>, array<'a>) => Config.return<'a> = "toMatchObject"
  }

  module List = {
    @inline
    let toContain = (expected, item) => {
      expected->unwrap->Belt.List.toArray->wrap->Array.toContain(item)
    }

    @inline
    let toHaveLength = (expected, length) => {
      expected->unwrap->Belt.List.toArray->wrap->Array.toHaveLength(length)
    }

    @inline
    let toMatch = (expected, list) => {
      expected->unwrap->Belt.List.toArray->wrap->Array.toMatch(list->Belt.List.toArray)
    }
  }

  module Dict = {
    @send
    external toHaveProperty: (expected<Js.Dict.t<'a>>, string, 'a) => Config.return<'a> =
      "toHaveProperty"

    @send
    external toHaveKey: (expected<Js.Dict.t<'a>>, string) => Config.return<'a> = "toHaveProperty"

    @send
    external toMatch: (expected<Js.Dict.t<'a>>, Js.Dict.t<'a>) => Config.return<'a> =
      "toMatchObject"
  }
}

module Expect = {
  include Matchers({
    type return<'a> = unit
    let emptyReturn = ()
  })

  module Promise = {
    @get external rejects: expected<promise<'a>> => expected<'a> = "rejects"
    @get external resolves: expected<promise<'a>> => expected<'a> = "resolves"

    include Matchers({
      type return<'a> = promise<unit>
      let emptyReturn = Js.Promise2.resolve()
    })

    @send
    external toThrow: (expected<'a>, Js.undefined<string>) => promise<unit> = "toThrow"
    @inline
    let toThrow = (~message=?, expected) => expected->toThrow(message->Js.Undefined.fromOption)

    @send
    external toThrowError: (expected<'a>, Js.undefined<string>) => promise<unit> = "toThrowError"
    @inline
    let toThrowError = (~message=?, expected) =>
      expected->toThrowError(message->Js.Undefined.fromOption)
  }
}

module Assert = {
  type t

  %%private(@module("vitest") @val external assert_obj: t = "assert")

  @send external equal: (t, 'a, 'a, Js.undefined<string>) => unit = "equal"

  @inline
  let equal = (~message=?, a, b) => assert_obj->equal(a, b, message->Js.Undefined.fromOption)

  @send external deepEqual: (t, 'a, 'a, Js.undefined<string>) => unit = "deepEqual"

  @inline
  let deepEqual = (~message=?, a, b) =>
    assert_obj->deepEqual(a, b, message->Js.Undefined.fromOption)
}

module Vi = {
  type t

  %%private(@module("vitest") @val external vi_obj: t = "vi")

  @send external advanceTimersByTime: (t, int) => t = "advanceTimersByTime"
  @inline let advanceTimersByTime = ms => vi_obj->advanceTimersByTime(ms)

  @send external advanceTimersToNextTimer: t => t = "advanceTimersToNextTimer"
  @inline let advanceTimersToNextTimer = () => vi_obj->advanceTimersToNextTimer

  @send external runAllTimers: t => t = "runAllTimers"
  @inline let runAllTimers = () => vi_obj->runAllTimers

  @send external runOnlyPendingTimers: t => t = "runOnlyPendingTimers"
  @inline let runOnlyPendingTimers = () => vi_obj->runOnlyPendingTimers

  @send external useFakeTimers: t => t = "useFakeTimers"
  @inline let useFakeTimers = () => vi_obj->useFakeTimers

  @send external useRealTimers: t => t = "useRealTimers"
  @inline let useRealTimers = () => vi_obj->useRealTimers

  @send external mockCurrentDate: (t, Js.Date.t) => t = "mockCurrentDate"
  @inline let mockCurrentDate = date => vi_obj->mockCurrentDate(date)

  @send external restoreCurrentDate: (t, Js.Date.t) => t = "restoreCurrentDate"
  @inline let restoreCurrentDate = date => vi_obj->restoreCurrentDate(date)

  @send external getMockedDate: t => Js.null<Js.Date.t> = "getMockedDate"
  @inline let getMockedDate = () => vi_obj->getMockedDate->Js.Null.toOption
}
