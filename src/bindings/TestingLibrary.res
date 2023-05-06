module React = {
  open Webapi
  type renderResult = {
    container: Dom.HtmlElement.t,
    baseElement: Dom.HtmlElement.t,
  }

  type renderOption = {
    container?: Dom.HtmlElement.t,
    baseElement?: Dom.HtmlElement.t,
    hydrate?: bool,
    legacyRoot?: bool,
    wrapper?: React.element,
  }

  @module("@testing-library/react") external render: React.element => renderResult = "render"
  @module("@testing-library/react")
  external renderWithOption: (React.element, renderOption) => renderResult = "render"
  @module("@testing-library/react") external cleanup: unit => unit = "cleanup"
}

module Dom = {
  open Webapi
  type t
  @module("@testing-library/dom") external screen: t = "screen"
  type queryFunction = (option<string>, option<Dom.Element.t>) => bool

  module ByPlaceholderText = {
    type options = {
      exact?: bool,
      normalizer?: string => string,
    }
    @send external get: (t, string) => Dom.HtmlElement.t = "getByPlaceholderText"
    @send
    external getWithOption: (t, string, options) => Dom.HtmlElement.t = "getByPlaceholderText"
    @send external getFromRegex: (t, Js.Re.t) => Dom.HtmlElement.t = "getByPlaceholderText"
    @send
    external getFromRegexWithOption: (t, Js.Re.t, options) => Dom.HtmlElement.t =
      "getByPlaceholderText"
    @send
    external getFromFunction: (t, queryFunction) => Dom.HtmlElement.t = "getByPlaceholderText"
    @send
    external getFromFunctionWithOption: (t, queryFunction, options) => Dom.HtmlElement.t =
      "getByPlaceholderText"

    @send external getAll: (t, string) => array<Dom.HtmlElement.t> = "getAllByPlaceholderText"
    @send
    external getAllWithOption: (t, string, options) => array<Dom.HtmlElement.t> =
      "getAllByPlaceholderText"
    @send
    external getAllFromRegex: (t, Js.Re.t) => array<Dom.HtmlElement.t> = "getAllByPlaceholderText"
    @send
    external getAllFromRegexWithOption: (t, Js.Re.t, options) => array<Dom.HtmlElement.t> =
      "getAllByPlaceholderText"
    @send
    external getAllFromFunction: (t, queryFunction) => array<Dom.HtmlElement.t> =
      "getAllByPlaceholderText"
    @send
    external getAllFromFunctionWithOption: (t, queryFunction, options) => array<Dom.HtmlElement.t> =
      "getAllByPlaceholderText"

    @send external query: (t, string) => option<Dom.HtmlElement.t> = "queryByPlaceholderText"
    @send
    external queryWithOption: (t, string, options) => option<Dom.HtmlElement.t> =
      "queryByPlaceholderText"
    @send
    external queryFromRegex: (t, Js.Re.t) => option<Dom.HtmlElement.t> = "queryByPlaceholderText"
    @send
    external queryFromRegexWithOption: (t, Js.Re.t, options) => option<Dom.HtmlElement.t> =
      "queryByPlaceholderText"
    @send
    external queryFromFunction: (t, queryFunction) => option<Dom.HtmlElement.t> =
      "queryByPlaceholderText"
    @send
    external queryFromFunctionWithOption: (t, queryFunction, options) => option<Dom.HtmlElement.t> =
      "queryByPlaceholderText"

    @send external queryAll: (t, string) => array<Dom.HtmlElement.t> = "queryAllByPlaceholderText"
    @send
    external queryAllWithOption: (t, string, options) => array<Dom.HtmlElement.t> =
      "queryAllByPlaceholderText"
    @send
    external queryAllFromRegex: (t, Js.Re.t) => array<Dom.HtmlElement.t> =
      "queryAllByPlaceholderText"
    @send
    external queryAllFromRegexWithOption: (t, Js.Re.t, options) => array<Dom.HtmlElement.t> =
      "queryAllByPlaceholderText"
    @send
    external queryAllFromFunction: (t, queryFunction) => array<Dom.HtmlElement.t> =
      "queryAllByPlaceholderText"
    @send
    external queryAllFromFunctionWithOption: (
      t,
      queryFunction,
      options,
    ) => array<Dom.HtmlElement.t> = "queryAllByPlaceholderText"

    @send external find: (t, string) => Js.Promise.t<Dom.HtmlElement.t> = "findByPlaceholderText"
    @send
    external findWithOption: (t, string, options) => Js.Promise.t<Dom.HtmlElement.t> =
      "findByPlaceholderText"
    @send
    external findFromRegex: (t, Js.Re.t) => Js.Promise.t<Dom.HtmlElement.t> =
      "findByPlaceholderText"
    @send
    external findFromRegexWithOption: (t, Js.Re.t, options) => Js.Promise.t<Dom.HtmlElement.t> =
      "findByPlaceholderText"
    @send
    external findFromFunction: (t, queryFunction) => Js.Promise.t<Dom.HtmlElement.t> =
      "findByPlaceholderText"
    @send
    external findFromFunctionWithOption: (
      t,
      queryFunction,
      options,
    ) => Js.Promise.t<Dom.HtmlElement.t> = "findByPlaceholderText"

    @send
    external findAll: (t, string) => Js.Promise.t<array<Dom.HtmlElement.t>> =
      "findAllByPlaceholderText"
    @send
    external findAllWithOption: (t, string, options) => Js.Promise.t<array<Dom.HtmlElement.t>> =
      "findAllByPlaceholderText"
    @send
    external findAllFromRegex: (t, Js.Re.t) => Js.Promise.t<array<Dom.HtmlElement.t>> =
      "findAllByPlaceholderText"
    @send
    external findAllFromRegexWithOption: (
      t,
      Js.Re.t,
      options,
    ) => Js.Promise.t<array<Dom.HtmlElement.t>> = "findAllByPlaceholderText"
    @send
    external findAllFromFunction: (t, queryFunction) => Js.Promise.t<array<Dom.HtmlElement.t>> =
      "findAllByPlaceholderText"
    @send
    external findAllFromFunctionWithOption: (
      t,
      queryFunction,
      options,
    ) => Js.Promise.t<array<Dom.HtmlElement.t>> = "findAllByPlaceholderText"
  }

  module ByText = {
    type options = {
      selector?: string,
      exact?: bool,
      ignore?: @unwrap [#String(string) | #Boolean(bool)],
      normalizer?: string => string,
    }

    @send external get: (t, string) => Dom.HtmlElement.t = "getByText"
    @send external getWithOption: (t, string, options) => Dom.HtmlElement.t = "getByText"
    @send external getFromRegex: (t, Js.Re.t) => Dom.HtmlElement.t = "getByText"
    @send
    external getFromRegexWithOption: (t, Js.Re.t, options) => Dom.HtmlElement.t = "getByText"
    @send external getFromFunction: (t, queryFunction) => Dom.HtmlElement.t = "getByText"
    @send
    external getFromFunctionWithOption: (t, queryFunction, options) => Dom.HtmlElement.t =
      "getByText"

    @send external getAll: (t, string) => array<Dom.HtmlElement.t> = "getAllByText"
    @send
    external getAllWithOption: (t, string, options) => array<Dom.HtmlElement.t> = "getAllByText"
    @send external getAllFromRegex: (t, Js.Re.t) => array<Dom.HtmlElement.t> = "getAllByText"
    @send
    external getAllFromRegexWithOption: (t, Js.Re.t, options) => array<Dom.HtmlElement.t> =
      "getAllByText"
    @send
    external getAllFromFunction: (t, queryFunction) => array<Dom.HtmlElement.t> = "getAllByText"
    @send
    external getAllFromFunctionWithOption: (t, queryFunction, options) => array<Dom.HtmlElement.t> =
      "getAllByText"

    @send external query: (t, string) => option<Dom.HtmlElement.t> = "queryByText"
    @send
    external queryWithOption: (t, string, options) => option<Dom.HtmlElement.t> = "queryByText"
    @send external queryFromRegex: (t, Js.Re.t) => option<Dom.HtmlElement.t> = "queryByText"
    @send
    external queryFromRegexWithOption: (t, Js.Re.t, options) => option<Dom.HtmlElement.t> =
      "queryByText"
    @send
    external queryFromFunction: (t, queryFunction) => option<Dom.HtmlElement.t> = "queryByText"
    @send
    external queryFromFunctionWithOption: (t, queryFunction, options) => option<Dom.HtmlElement.t> =
      "queryByText"

    @send external queryAll: (t, string) => array<Dom.HtmlElement.t> = "queryAllByText"
    @send
    external queryAllWithOption: (t, string, options) => array<Dom.HtmlElement.t> = "queryAllByText"
    @send external queryAllFromRegex: (t, Js.Re.t) => array<Dom.HtmlElement.t> = "queryAllByText"
    @send
    external queryAllFromRegexWithOption: (t, Js.Re.t, options) => array<Dom.HtmlElement.t> =
      "queryAllByText"
    @send
    external queryAllFromFunction: (t, queryFunction) => array<Dom.HtmlElement.t> = "queryAllByText"
    @send
    external queryAllFromFunctionWithOption: (
      t,
      queryFunction,
      options,
    ) => array<Dom.HtmlElement.t> = "queryAllByText"

    @send external find: (t, string) => Js.Promise.t<Dom.HtmlElement.t> = "findByText"
    @send
    external findWithOption: (t, string, options) => Js.Promise.t<Dom.HtmlElement.t> = "findByText"
    @send external findFromRegex: (t, Js.Re.t) => Js.Promise.t<Dom.HtmlElement.t> = "findByText"
    @send
    external findFromRegexWithOption: (t, Js.Re.t, options) => Js.Promise.t<Dom.HtmlElement.t> =
      "findByText"
    @send
    external findFromFunction: (t, queryFunction) => Js.Promise.t<Dom.HtmlElement.t> = "findByText"
    @send
    external findFromFunctionWithOption: (
      t,
      queryFunction,
      options,
    ) => Js.Promise.t<Dom.HtmlElement.t> = "findByText"

    @send
    external findAll: (t, string) => Js.Promise.t<array<Dom.HtmlElement.t>> = "findAllByText"
    @send
    external findAllWithOption: (t, string, options) => Js.Promise.t<array<Dom.HtmlElement.t>> =
      "findAllByText"
    @send
    external findAllFromRegex: (t, Js.Re.t) => Js.Promise.t<array<Dom.HtmlElement.t>> =
      "findAllByText"
    @send
    external findAllFromRegexWithOption: (
      t,
      Js.Re.t,
      options,
    ) => Js.Promise.t<array<Dom.HtmlElement.t>> = "findAllByText"
    @send
    external findAllFromFunction: (t, queryFunction) => Js.Promise.t<array<Dom.HtmlElement.t>> =
      "findAllByText"
    @send
    external findAllFromFunctionWithOption: (
      t,
      queryFunction,
      options,
    ) => Js.Promise.t<array<Dom.HtmlElement.t>> = "findAllByText"
  }
}

module Event = {
  open Webapi

  type t

  type options = {
    advanceTimers?: int => Js.Promise.t<unit>,
    applyAccept?: bool,
    autoModify?: bool,
    delay?: int,
    document?: Dom.Document.t,
    skipAutoClose?: bool,
    skipClick?: bool,
    skipHover?: bool,
    writeToClipboard?: bool,
  }

  @module("@testing-library/user-event") @scope("default") external setup: unit => t = "setup"
  @module("@testing-library/user-event") @scope("default")
  external setupWithOption: unit => t = "setup"

  @send external keyboard: (t, string) => Js.Promise.t<unit> = "keyword"
  @send external tab: (t, string) => Js.Promise.t<unit> = "tab"
  @send external tabShift: (t, string, @as("json`{ shift: true }`") _) => Js.Promise.t<unit> = "tab"

  @send external click: (t, Dom.HtmlElement.t) => Js.Promise.t<unit> = "click"
  @send external dblClick: (t, Dom.HtmlElement.t) => Js.Promise.t<unit> = "dblClick"
  @send external tripleClick: (t, Dom.HtmlElement.t) => Js.Promise.t<unit> = "tripleClick"
  @send external hover: (t, Dom.HtmlElement.t) => Js.Promise.t<unit> = "hover"
  @send external unhover: (t, Dom.HtmlElement.t) => Js.Promise.t<unit> = "unhover"

  // clipboard
  @send external copy: t => Js.Promise.t<option<Dom.DataTransfer.t>> = "copy"
  @send external cut: t => Js.Promise.t<option<Dom.DataTransfer.t>> = "cut"
  @send external paste: (t, string) => Js.Promise.t<unit> = "paste"
  @send external pasteDataTransfer: (t, Dom.DataTransfer.t) => Js.Promise.t<unit> = "paste"

  // utils
  @send external clear: (t, Dom.HtmlElement.t) => Js.Promise.t<unit> = "clear"

  // (de)select options
  @send
  external selectOptions: (t, Dom.HtmlElement.t, string) => Js.Promise.t<unit> = "selectOptions"
  @send
  external selectOptionsArray: (t, Dom.HtmlElement.t, array<string>) => Js.Promise.t<unit> =
    "selectOptions"
  @send
  external selectOptionsElement: (t, Dom.HtmlElement.t, Dom.HtmlElement.t) => Js.Promise.t<unit> =
    "selectOptions"
  @send
  external selectOptionsElementArray: (
    t,
    Dom.HtmlElement.t,
    array<Dom.HtmlElement.t>,
  ) => Js.Promise.t<unit> = "selectOptions"

  @send
  external deselectOptions: (t, Dom.HtmlElement.t, string) => Js.Promise.t<unit> = "deselectOptions"
  @send
  external deselectOptionsArray: (t, Dom.HtmlElement.t, array<string>) => Js.Promise.t<unit> =
    "deselectOptions"
  @send
  external deselectOptionsElement: (t, Dom.HtmlElement.t, Dom.HtmlElement.t) => Js.Promise.t<unit> =
    "deselectOptions"
  @send
  external deselectOptionsElementArray: (
    t,
    Dom.HtmlElement.t,
    array<Dom.HtmlElement.t>,
  ) => Js.Promise.t<unit> = "deselectOptions"

  // type
  type typeOption = {
    skipClick?: bool,
    skipAutoClose?: bool,
    initialSelectionStart?: int,
    initialSelectionEnd?: int,
  }
  @send external type_: (t, Dom.HtmlElement.t, string) => Js.Promise.t<unit> = "type"
  @send
  external typeWithOption: (t, Dom.HtmlElement.t, string, typeOption) => Js.Promise.t<unit> = "type"

  // pointer
  type pointer
  type pointerCoords = {
    x?: int,
    y?: int,
    clientX?: int,
    clientY?: int,
    offsetX?: int,
    offsetY?: int,
    pageX?: int,
    pageY?: int,
    screenX?: int,
    screenY?: int,
  }
  type pointerActionPosition = {
    keys: string,
    target?: Dom.HtmlElement.t,
    coords?: pointerCoords,
    node?: Dom.Node.t,
    offset?: int,
  }
  type pointerKey = {
    /** Name of the pointer key */
    name: string,
    /** Type of the pointer device */
    pointerType: [#mouse | #pen | #touch],
    /** Type of button */
    button?: int, // @TODO: https://github.com/testing-library/user-event/blob/1aa2027e5ec445ab413808556efa7763b65053d3/src/system/pointer/buttons.ts#L45
  }
  type pointerPressAction = {
    target?: Dom.HtmlElement.t,
    coords?: pointerCoords,
    node?: Dom.Node.t,
    offset?: int,
    keyDef: pointerKey,
    releasePrevious: bool,
    releaseSelf: bool,
  }
  type pointerMoveAction = {
    target?: Dom.HtmlElement.t,
    coords?: pointerCoords,
    node?: Dom.Node.t,
    offset?: int,
    pointerName?: string,
  }
  external createPointer: string => pointer = "%identity"
  external createPointerActionPosition: pointerActionPosition => pointer = "%identity"
  external createPointerPressAction: pointerPressAction => pointer = "%identity"
  external createPointerMoveAction: pointerMoveAction => pointer = "%identity"

  @send external pointer: (t, string) => Js.Promise.t<unit> = "pointer"
  @send external pointerByIdentifier: (t, pointer) => Js.Promise.t<unit> = "pointer"
  @send external pointerWithArray: (t, array<pointer>) => Js.Promise.t<unit> = "pointer"
}
