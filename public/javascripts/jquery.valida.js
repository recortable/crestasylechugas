
(function ($) {

  if (typeof console == "undefined" || typeof console.log == "undefined") {
    console = {
      log : function() {
      }
    };
  }

    var validators = {
        not_empty : function (ctx, text) {
            if (text == "") {
                addError("no puede estar vac&iacute;o", this, ctx)
            }
        }
    };



    $.fn.valida = function() {
        var ctx = {
            errors : 0
        };

        $(this).find("p.error").remove();
        var result = this.each(function() {
            $(this).children("input").each(function () {
                var element = $(this);
                element.removeClass("error");
                validate(element, ctx);
            });
        });

        if (ctx.errors == 0) {
            this.submit();
        }

        return result;
    };


    var validate = function (e, ctx) {
        var args = [];
        args.push(ctx);
        args.push($.trim(e.val()));
        methods = e.attr('class').split(' ');
        $.each(methods, function() {
            var method = validators[this];
            if (method != null) {
                method.apply(e, args)
            }
        });
    };


    var addError = function(message, element, ctx) {
        element.addClass("error");
        element.after('<p class="error">' + message +'</p>');
        ctx.errors++;
    };

})(jQuery);



