# 评分插件封装
# @version 0.0.1
# @author think2011
# @doc wbotelhos.com/raty
do ->
  app = angular.module 'raty', []

  app.directive 'raty', ->
    return {
      restrict: 'A'
      scope:
        ngModel: '='
      link: (scope, element, attrs) ->
        # view to model
        $(element).raty
          click: (score, evt) ->
            scope.$apply ->
              scope.ngModel = score

        # model to view
        scope.$watch 'ngModel', (newVal) ->
          if newVal
            $(element).raty 'score', newVal
          else
            scope.ngModel = 1
    }