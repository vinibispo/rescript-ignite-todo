%%raw("import './global.css'")

@react.component
let make = () => {
  <Button onClick={_ => Js.log("Clicked")}>
    <React.Fragment>
      {"Criar "->React.string}
      <PhosphorReact.PlusCircle size={15} />
    </React.Fragment>
  </Button>
}
