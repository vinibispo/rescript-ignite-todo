%%raw("import './global.css'")
@module("./App.module.css") external styles: {..} = "default"

@react.component
let make = () => {
  <div className={styles["wrapper"]}>
    <Header />
    <main className={styles["content"]}>
      <Button onClick={_ => Js.log("Clicked")}>
        <React.Fragment>
          {"Criar "->React.string}
          <PhosphorReact.PlusCircle size={15} />
        </React.Fragment>
      </Button>
    </main>
  </div>
}
