## Key Navigation Proof of Concept

Pseudo code for keyboard navigation logic in Columns and Rows etc.:
```
Parent {
    keyNavigation(event) {
        ...handle key event...
    }

    Child {
        onSendKeyEvent: keyNavigation
    }
    Child {
        onSendKeyEvent: keyNavigation
    }
}
```

```
Child {
    signal sendKeyEvent
    onKeyPressed: keyNavigation(key)
```

```
function keyNavigation(event)
    handleKey(event))
    if (trying to navigate to a non-existing element)
        sendKeyEvent(event)
    else 
        navigate to (event.key.keyDirection)

```