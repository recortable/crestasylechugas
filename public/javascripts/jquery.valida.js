
(function ($) {

    var validate = function (e, args) {
        methods = e.attr('class').split(' ');
        console.log("validating " + methods);
        $.each(methods, function() {
            var method = validators[this];
            if (method != null) {
                method.apply(e, args)
            }
        });
    }

    var validators = {
        not_empty : function (ctx) {
            console.log("not empty to: " + this + ", ctx: " + ctx);
            this.addClass("error")
            this.after('<br/><p class="error">no puede estar vac&iacute;o</p>');
            ctx.errors++;
        }
    };

    $.fn.valida = function() {
        var ctx = {
            errors : 0
        };
        args = [];
        args.push(ctx);
        var result = this.each(function() {
            $(this).children("input").each(function () {
                validate($(this), args);
            });
        });
        console.log("errors: " + ctx.errors)
        return result;
    }

})(jQuery);



