for USER_NAME in "$@"; do
  if id "$USER_NAME" &>/dev/null; then
    echo "Внимание: Пользователь $USER_NAME уже существует!"
  else
    USER_PASS=$(openssl rand -base64 12)
    useradd -m -s /bin/bash "$USER_NAME"
    usermod -aG sudo "$USER_NAME"
    echo "$USER_NAME:$USER_PASS" | chpasswd
    echo "------------------------------------------"
    echo "Пользователь $USER_NAME успешно создан!"
    echo "Пароль для входа: $USER_PASS"
    echo "------------------------------------------"
  fi
done
