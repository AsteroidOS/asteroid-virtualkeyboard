set(STYLEDEST "${CMAKE_INSTALL_LIBDIR}/qml/QtQuick/VirtualKeyboard/Styles/watch")
install(FILES style.qml DESTINATION "${STYLEDEST}")
install(DIRECTORY images/ DESTINATION "${STYLEDEST}/images")

