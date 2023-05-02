@module("./Button.module.css") external styles: {..} = "default"
@react.component
let make = (~type_, ~children) => {
  <button type_ className={styles["main"]}> children </button>
}
