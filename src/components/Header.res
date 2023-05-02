@module("../assets/logo.svg") external logoImg: string = "default"

@module("./Header.module.css") external styles: {..} = "default"
@react.component
let make = () => {
  <header className={styles["main"]}>
    <img src={logoImg} />
  </header>
}
