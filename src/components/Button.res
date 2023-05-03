@module("./Button.module.css") external styles: {..} = "default"
@react.component
let make = (~type_, ~children, ~disabled) => {
  <button type_ className={styles["main"]} disabled> children </button>
}
