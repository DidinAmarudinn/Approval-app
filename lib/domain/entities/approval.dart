import 'module.dart';

class Approval {
    Approval({
        this.id,
        this.card,
        this.title,
        this.date,
        this.bagde,
        this.footer,
    });

    int? id;
    Card? card;
    String? title;
    String? date;
    BagdeApproval? bagde;
    String? footer;
}

class BagdeApproval {
    BagdeApproval({
        this.text,
        this.color,
    });

    String? text;
    String? color;

  
}