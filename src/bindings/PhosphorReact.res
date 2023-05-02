type weight = [#thin | #light | #regular | #bold | #fill | #duotone]
type props = {
  color?: string,
  size?: int,
  weight?: weight,
  mirrored?: bool,
  alt?: string,
}
type iconComponent = React.component<props>
module PlusCircle = {
  @module("@phosphor-icons/react") external make: iconComponent = "PlusCircle"
}

module ClipboardText = {
  @module("@phosphor-icons/react") external make: iconComponent = "ClipboardText"
}

module Trash = {
  @module("@phosphor-icons/react") external make: iconComponent = "Trash"
}

module Check = {
  @module("@phosphor-icons/react") external make: iconComponent = "Check"
}
