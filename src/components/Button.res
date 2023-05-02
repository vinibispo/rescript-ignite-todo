@module("./Button.module.css") external styles: {..} = "default"
@react.component
let make = (~onClick, ~children) => {
  <button onClick={onClick} className={styles["main"]}> children </button>
}
