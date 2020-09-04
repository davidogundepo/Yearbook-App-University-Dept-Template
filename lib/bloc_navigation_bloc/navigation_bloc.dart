
import 'package:bloc/bloc.dart';
import '../thrown_pages/departmental_graduates_a_thrown_page.dart';
import '../thrown_pages/departmental_graduates_b_thrown_page.dart';
import '../thrown_pages/departmental_graduates_c_thrown_page.dart';
import '../thrown_pages/departmental_graduates_d_thrown_page.dart';
import '../thrown_pages/departmental_executives_thrown_page.dart';
import '../thrown_pages/departmental_staff_thrown_page.dart';

enum NavigationEvents {
  MyDepartmentalGraduatesAClickedEvent,
  MyDepartmentalGraduatesBClickedEvent,
  MyDepartmentalGraduatesCClickedEvent,
  MyDepartmentalGraduatesDClickedEvent,
  MyDepartmentalExecutivesClickedEvent,
  MyDepartmentalStaffClickedEvent,

}


abstract class NavigationStates {}


class NavigationBloc extends Bloc<NavigationEvents, NavigationStates> {
  @override
  NavigationStates get initialState => MyDepartmentalGraduatesPageA();

  @override
  Stream<NavigationStates> mapEventToState(NavigationEvents events) async* {
    switch (events) {
      case NavigationEvents.MyDepartmentalGraduatesAClickedEvent:
        yield MyDepartmentalGraduatesPageA();
        break;
      case NavigationEvents.MyDepartmentalGraduatesBClickedEvent:
        yield MyDepartmentalGraduatesPageB();
        break;
      case NavigationEvents.MyDepartmentalGraduatesCClickedEvent:
        yield MyDepartmentalGraduatesPageC();
        break;
      case NavigationEvents.MyDepartmentalGraduatesDClickedEvent:
        yield MyDepartmentalGraduatesPageD();
        break;
      case NavigationEvents.MyDepartmentalExecutivesClickedEvent:
        yield MyDepartmentalExecutivesPage();
        break;
      case NavigationEvents.MyDepartmentalStaffClickedEvent:
        yield MyDepartmentalStaffPage();
        break;
    }
  }


}
