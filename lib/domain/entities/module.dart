class Module {
    Module({
        this.module,
        this.card,
        this.title,
        this.icon,
        this.bagde,
    });

    String? module;
    Card? card;
    String? title;
    String? icon;
    Bagde? bagde;
}

class Bagde {
    Bagde({
        this.waiting,
        this.today,
        this.overdue,
    });

    Overdue? waiting;
    Overdue? today;
    Overdue? overdue;

    
}

class Overdue {
    Overdue({
        this.text,
        this.color,
    });

    int? text;
    String? color;
}

class Card {
    Card({
        this.shadowColor,
    });

    String? shadowColor;
}
