package dockerfile.security

deny[msg] {
  input[i].Cmd == "user"
  lower(concat(" ", input[i].Value)) == "root"
  msg := "Dockerfile must not switch to root user"
}

deny[msg] {
  not user_declared
  msg := "Dockerfile should declare a non-root USER"
}

user_declared {
  input[i].Cmd == "user"
  lower(concat(" ", input[i].Value)) != "root"
}
