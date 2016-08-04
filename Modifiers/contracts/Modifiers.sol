contract Modifiers {

    uint public val = 0;

    modifier modifierWithoutUnderscore() {
        val = 1;
    }
    modifier modifierWithUnderscore() {
        val = 1;
        _
    }

    function withoutUnderscore() modifierWithoutUnderscore() {
        val = 2;
    }

    function withUnderscore() modifierWithUnderscore() {
        val = 2;
    }

}
